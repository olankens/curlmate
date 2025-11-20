#!/usr/bin/env bash

# Get all directories in current path (excluding .)
for folder in */; do
    if [ -d "$folder" ]; then
        # Change into the folder
        cd "$folder"

        # Add all files in this folder
        git add .

        # Commit with message "Dummy"
        git commit -m "Dummy"

        # Push the commit (ignore errors)
        git push || true

        # Go back to parent directory
        cd ..
    fi
done
