#!/bin/bash

# Define the list of role directories to move
ROLES=("db" "file_servers" "web" "workstations")
TARGET_DIR="roles"

# Ensure the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Created target directory: $TARGET_DIR"
fi

# Iterate through the array and move each role safely
for role in "${ROLES[@]}"; do
    # Check if the source directory exists
    if [ -d "$role" ]; then
        # Prevent overwriting if the directory already exists in the target location
        if [ -d "${TARGET_DIR}/${role}" ]; then
            echo "Warning: '${role}' already exists in ${TARGET_DIR}/. Skipping operation."
        else
            mv "$role" "$TARGET_DIR/"
            echo "Success: Moved '${role}' to ${TARGET_DIR}/"
        fi
    else
        echo "Notice: Source directory '${role}' not found in the current path."
    fi
done
