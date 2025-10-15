---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
description: Create a git commit
---

# Create a Git Commit

Generate an English commit message following the Conventional Commits specification.

## Rules

- Types: `feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
- Subject: imperative, lowercase, ≤72 chars, no period.
- Scope: optional; inferred from changed directory or provided.
- Include concise bullets describing key changes.

## Example

```
feat: add OAuth2 login

Add OAuth2 authorization code flow with PKCE.

- add login and callback routes
- implement PKCE challenge/verify
- store tokens securely in httpOnly cookies
```
