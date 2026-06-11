#!/usr/bin/env bash
# ==============================================================================
# Helper Utilities for Project Initializers
# File: init-project-langs/utils.bash
#
# This script is sourced by language-specific initializer scripts to provide
# consistent utility functions, reducing code duplication and standardizing
# path resolution, Git setup, and user input validation.
# ==============================================================================

# Ensure DOTFILES defaults to the standard location if not set in environment
DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
TEMPLATES_DIR="$DOTFILES/templates"

# ------------------------------------------------------------------------------
# require_cmd
# Purpose: Check if a given command is installed on the host system.
# Arguments:
#   $1 - The command name (e.g., git, uv, envsubst)
# Returns:
#   0 if command is found, 1 if command is missing (prints error to stderr)
# ------------------------------------------------------------------------------
require_cmd() {
    if ! command -v "$1" &>/dev/null; then
        echo "Error: '$1' is required but not installed on this system." >&2
        return 1
    fi
    return 0
}

# ------------------------------------------------------------------------------
# resolve_project_dir
# Purpose: Clean up and safely create the target project directory.
# Arguments:
#   $1 - The user-supplied directory path (relative or absolute)
# Returns:
#   Outputs the absolute path of the resolved/created directory to stdout.
#   Returns non-zero status if directory creation fails.
# Behavior:
#   - If empty, defaults to current working directory.
#   - Sanitizes name by lowercasing and replacing multiple whitespace characters
#     with a single hyphen.
# ------------------------------------------------------------------------------
resolve_project_dir() {
    local dir_input="$1"
    local dir_resolved
    
    if [[ -z "$dir_input" ]]; then
        # Default to current directory if user hit enter
        dir_resolved="$(pwd)"
    else
        # 1. Strip leading and trailing whitespace
        # 2. Convert to lowercase and replace internal whitespace sequences with a single hyphen (-)
        local sanitized
        sanitized="$(echo -n "$dir_input" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
        sanitized="$(echo -n "$sanitized" | tr '[:upper:]' '[:lower:]' | tr -s '[:space:]' '-')"
        
        # Try creating the directory
        if ! mkdir -p "$sanitized"; then
            echo "Error: Failed to create directory '$sanitized'" >&2
            return 1
        fi
        
        # Resolve to absolute path
        dir_resolved="$(cd "$sanitized" && pwd)"
    fi
    
    echo "$dir_resolved"
}

# ------------------------------------------------------------------------------
# prompt_yes_no
# Purpose: Ask the user a yes/no question with a default value.
# Arguments:
#   $1 - The prompt message to print (e.g., "Use git? ([y]/n) ")
#   $2 - The default choice ('y' or 'n') if the user hits Enter
# Returns:
#   0 (true) if 'yes' selected, 1 (false) if 'no' selected.
# ------------------------------------------------------------------------------
prompt_yes_no() {
    local prompt_msg="$1"
    local default_choice="$2"
    local choice
    
    read -p "$prompt_msg" choice
    if [[ -z "$choice" ]]; then
        choice="$default_choice"
    fi
    
    case "$choice" in
        [yY]*|[yY])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# ------------------------------------------------------------------------------
# init_git
# Purpose: Initialize Git repository and optionally Git Flow.
# Arguments:
#   $1 - Target project directory path
#   $2 - "true" to initialize git flow, "false" to skip
# Returns:
#   0 on success, non-zero if git initialization or initial commit fails.
# ------------------------------------------------------------------------------
init_git() {
    local target_dir="$1"
    local use_git_flow="$2"
    
    # Git is mandatory to run this helper
    if ! require_cmd git; then
        return 1
    fi
    
    # Initialize repository if .git directory doesn't already exist
    if [[ ! -d ".git" ]]; then
        git init -q || return 1
    fi
    
    # Create the initial commit so that we have a master/main branch
    # before attempting git flow initialization
    git add .
    git commit -m "Initial commit" &> /dev/null
    
    # Initialize Git Flow if requested and available
    if [[ "$use_git_flow" == "true" ]]; then
        if command -v git-flow &>/dev/null; then
            # 'git flow init -d' automatically chooses default branch names
            # (production: master, integration: develop, etc.) non-interactively
            git flow init -d > /dev/null
        else
            echo "Warning: git-flow is not installed. Skipping git-flow setup." >&2
        fi
    fi
}

# ------------------------------------------------------------------------------
# render_template
# Purpose: Substitute specific placeholders in a template file using sed.
# Arguments:
#   $1 - Path to template file
#   $2 - Path to output file
#   $@ - Array of KEY=VALUE pairs to replace (e.g. "PROJECT_NAME=MyProject")
# ------------------------------------------------------------------------------
render_template() {
    local template_file="$1"
    local output_file="$2"
    shift 2
    
    local sed_args=()
    for pair in "$@"; do
        local key="${pair%%=*}"
        local val="${pair#*=}"
        
        # Escape sed replacement special characters: \, /, and &
        local escaped_val
        escaped_val=$(echo -n "$val" | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\&/g')
        
        # Replace {{KEY}}
        sed_args+=("-e" "s/{{$key}}/$escaped_val/g")
    done
    
    sed "${sed_args[@]}" "$template_file" > "$output_file"
}
