#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <branch-name> [base-branch]"
    exit 1
fi

BRANCH_NAME=$1
BASE_BRANCH=${2:-main}
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
WORKTREE_PATH="../${REPO_NAME}-${BRANCH_NAME}"

# Create worktree
git worktree add -b "$BRANCH_NAME" "$WORKTREE_PATH" "$BASE_BRANCH"

# Setup environment
cd "$WORKTREE_PATH"
npm install  # or your setup command

# Create task file
echo "# Task: $BRANCH_NAME
## Description:
[Add your task description here]

## Files to modify:
-

## Success criteria:
- " > TASK.md

# Open in editor
code .

echo "Worktree created at: $WORKTREE_PATH"
echo "Task file created: TASK.md"
echo "Ready for Claude Code!"