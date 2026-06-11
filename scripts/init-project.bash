#!/usr/bin/env bash
# ==============================================================================
# Project Initializer - Main CLI Entrypoint
# File: init-project.bash
#
# This script lists supported project types dynamically and prompts the user
# (using fzf or standard shell select) to select one. It then executes the
# corresponding script in the init-project-langs directory.
# ==============================================================================

# Setup environment variables
DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
SCRIPTS_DIR="$DOTFILES/scripts/init-project-langs"

# Find available languages dynamically by checking files in the langs folder
LANGS=()
if [[ -d "$SCRIPTS_DIR" ]]; then
    for f in "$SCRIPTS_DIR"/*.bash; do
        [[ -e "$f" ]] || continue
        basename=$(basename "$f" .bash)
        # Skip the utility file (utils.bash)
        if [[ "$basename" != "utils" ]]; then
            LANGS+=("$basename")
        fi
    done
fi

# Exit if no language files are found
if [[ ${#LANGS[@]} -eq 0 ]]; then
    echo "Error: No project templates found in $SCRIPTS_DIR" >&2
    exit 1
fi

selected=""

# If user provided a command line argument, use it directly
if [[ $# -ge 1 ]]; then
    selected="$1"
else
    # Fallback to fzf if installed; otherwise use native select prompt
    if command -v fzf &>/dev/null; then
        selected=$(printf "%s\n" "${LANGS[@]}" | fzf)
    else
        echo "fzf not found. Please select a project language from the menu below:"
        # Set prompt format for select
        PS3="Enter option number (1-${#LANGS[@]}): "
        select opt in "${LANGS[@]}"; do
            if [[ -n "$opt" ]]; then
                selected="$opt"
                break
            fi
        done
    fi
fi

# Exit if the selection was aborted
if [[ -z "$selected" ]]; then
    echo "Error: No option selected. Exiting." >&2
    exit 1
fi

# Ensure the selected language initializer exists
script_path="$SCRIPTS_DIR/${selected}.bash"
if [[ ! -f "$script_path" ]]; then
    echo "Error: Language '${selected}' is not supported (script not found at $script_path)." >&2
    exit 1
fi

# Execute the lang script, forwarding any arguments after the language name (e.g., $2, $3...)
bash "$script_path" "${@:2}"
