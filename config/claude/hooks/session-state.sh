#!/usr/bin/env bash

# Claude Code hook input is a JSON object on stdin.  Keep one small, atomic
# state file per interactive session so that other tools can inspect it.
set -euo pipefail

event="${1:?hook event is required}"
state_root="${XDG_STATE_HOME:-$HOME/.local/state}/claude-sessions"
payload_file="$(mktemp "${TMPDIR:-/tmp}/claude-hook.XXXXXX")"
trap 'rm -f "$payload_file"' EXIT
cat > "$payload_file"

session_id="$(jq -r '.session_id // empty' "$payload_file")"
if [[ -z "$session_id" || "$session_id" == *[^A-Za-z0-9._-]* ]]; then
  # A hook must never interrupt Claude because its bookkeeping failed.
  exit 0
fi

agent_id="$(jq -r '.agent_id // empty' "$payload_file")"
if [[ -n "$agent_id" && "$agent_id" == *[^A-Za-z0-9._-]* ]]; then
  exit 0
fi

wezterm_pane="${WEZTERM_PANE:-}"
if [[ ! "$wezterm_pane" =~ ^[0-9]+$ ]]; then
  wezterm_pane=""
fi

if [[ -n "$agent_id" ]]; then
  kind="subagent"
  target="$state_root/$session_id.$agent_id.json"
else
  kind="session"
  target="$state_root/$session_id.json"
fi

case "$event" in
  SessionStart) status="waiting" ;;
  UserPromptSubmit|CwdChanged) status="running" ;;
  PreToolUse|PostToolUse) status="busy" ;;
  PermissionRequest|Notification|PermissionDenied|StopFailure) status="needs_attention" ;;
  Stop) status="waiting" ;;
  SubagentStart)
    [[ -n "$agent_id" ]] || exit 0
    kind="subagent"
    target="$state_root/$session_id.$agent_id.json"
    status="running"
    ;;
  SubagentStop)
    [[ -n "$agent_id" ]] || exit 0
    rm -f "$state_root/$session_id.$agent_id.json"
    exit 0
    ;;
  SessionEnd)
    rm -f "$target"
    if [[ "$kind" == "session" ]]; then
      rm -f "$state_root/$session_id".*.json
    fi
    exit 0
    ;;
  *) exit 0 ;;
esac

mkdir -p "$state_root"

if [[ -z "$wezterm_pane" && -f "$target" ]]; then
  wezterm_pane="$(jq -r '.wezterm_pane // empty' "$target")"
  if [[ ! "$wezterm_pane" =~ ^[0-9]+$ ]]; then
    wezterm_pane=""
  fi
fi

cwd="$(jq -r '.cwd // empty' "$payload_file")"
agent_type="$(jq -r '.agent_type // empty' "$payload_file")"
timestamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
timestamp_epoch="$(date +%s)"
temporary="$(mktemp "$state_root/.${session_id}.${agent_id:-session}.XXXXXX")"

jq -n \
  --arg session_id "$session_id" \
  --arg kind "$kind" \
  --arg agent_id "$agent_id" \
  --arg agent_type "$agent_type" \
  --arg wezterm_pane "$wezterm_pane" \
  --arg cwd "$cwd" \
  --arg status "$status" \
  --arg event "$event" \
  --arg updated_at "$timestamp" \
  --argjson updated_at_epoch "$timestamp_epoch" \
  --argjson pid "$PPID" \
  '({session_id: $session_id, kind: $kind, cwd: $cwd, status: $status, event: $event, updated_at: $updated_at, updated_at_epoch: $updated_at_epoch, pid: $pid}
    + if $kind == "subagent" then {parent_session_id: $session_id, agent_id: $agent_id, agent_type: $agent_type} else {} end
    + if $wezterm_pane != "" then {wezterm_pane: ($wezterm_pane | tonumber)} else {} end)' \
  > "$temporary"
mv -f "$temporary" "$target"
