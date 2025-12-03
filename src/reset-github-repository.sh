#!/usr/bin/env bash

# Exit on any error
set -e

# Get current folder name as repo name
repo_name=$(basename "$(pwd)")

# Get authenticated GitHub username
user=$(gh api user --jq '.login')

# Get repo description
repo_description=$(gh repo view "$user/$repo_name" --json description -q ".description")

# Get repo visibility
repo_visibility=$(gh repo view "$user/$repo_name" --json visibility -q ".visibility")
[[ "$repo_visibility" = "PUBLIC" ]] && repo_visibility="--public" || repo_visibility="--private"

# Delete existing remote repo
gh repo delete "$user/$repo_name" --yes

# Remove any existing local git history
rm -rf .git
git init

# Create new repo on GitHub
gh repo create "$repo_name" \
    "$repo_visibility" \
    --description "$repo_description" \
    --source=. \
    --remote=origin

# # Create initial commit
# git add .
# git commit -m "Initial commit"
# git push -u origin main
