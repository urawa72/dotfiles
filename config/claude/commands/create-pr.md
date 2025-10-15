---

allowed-tools: Bash(gh pr create:*), Bash(git push:*), Bash(git log:*), Bash(git rev-parse:*)
description: Create a GitHub pull request via gh
---

# Create a GitHub Pull Request

Use the GitHub CLI (`gh`) to create a pull request from the current branch.

## Steps

1. Determine the current branch name and ensure it’s pushed to origin.
2. If a `.github/PULL_REQUEST_TEMPLATE.md` (or similar) exists, use it for the PR body.
3. If no template is found, summarize the recent commits on this branch:
  - Use the latest Conventional Commit–style commit message as the PR title.
  - Generate a short English summary (1–2 sentences) and bullet list of changes for the body.
4. Run:
   ```bash
   gh pr create --title "<conventional commit title>" --body "<summary and bullets>"
   ```
5. Confirm that the PR is created successfully and open it in the browser if desired.

## Example

```
Title: feat(ui): add dark mode toggle

Body:
Add a dark mode toggle for the main interface.

- add toggle button to header
- store preference in localStorage
- update styles for dark theme
```
