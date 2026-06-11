#!/usr/bin/env bash
# ==============================================================================
# Python Project Initializer
# File: init-project-langs/python.bash
#
# Generates a standard Python project workspace with a virtual environment,
# pyproject.toml setup (via uv or native python3), gitignore, and Git/Git Flow.
# ==============================================================================

# Source common utilities (paths, git init, yes/no prompt)
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/utils.bash" || exit 1

# 1. Interactive Prompts
read -p "Directory name (default current directory): " dir_input
read -p "Python version (default 3.12): " python_version
python_version="${python_version:-3.12}"

use_git=false
use_git_flow=false

if prompt_yes_no "Use git? ([y]/n) " "y"; then
    use_git=true
    if prompt_yes_no "Use git flow? ([y]/n) " "y"; then
        use_git_flow=true
    fi
fi

# 2. Resolve and Create Project Directory Safely
project_dir=$(resolve_project_dir "$dir_input") || exit 1
cd "$project_dir" || exit 1

# Validate template directory exists
if [[ ! -d "$TEMPLATES_DIR" ]]; then
    echo "Error: Templates directory not found at $TEMPLATES_DIR" >&2
    exit 1
fi

if [[ ! -f "$TEMPLATES_DIR/gitignore.python" ]]; then
    echo "Error: Template file $TEMPLATES_DIR/gitignore.python not found." >&2
    exit 1
fi
cp "$TEMPLATES_DIR/gitignore.python" .gitignore

# 3. Initialize Project & Environment (using uv if available, otherwise python venv)
if command -v uv &>/dev/null; then
    # Initialize using 'uv'
    if [[ "$use_git" == "true" ]]; then
        uv init --vcs git --author-from git --python "$python_version"
    else
        uv init --vcs none --author-from auto --python "$python_version"
    fi
    
    # Append custom configuration from pyproject.toml template if it exists
    if [[ -f "$TEMPLATES_DIR/pyproject.toml" ]]; then
        # Skip the first 7 lines of the template (which might contain template metadata)
        if [[ $(wc -l < "$TEMPLATES_DIR/pyproject.toml") -ge 8 ]]; then
            tail -n +8 "$TEMPLATES_DIR/pyproject.toml" >> pyproject.toml
        else
            cat "$TEMPLATES_DIR/pyproject.toml" >> pyproject.toml
        fi
    fi
    
    # Create the virtual environment
    uv venv
else
    # Fallback to standard Python venv if 'uv' is not installed
    echo "Warning: 'uv' is not installed. Falling back to native python3 virtual environment." >&2
    if require_cmd python3; then
        python3 -m venv .venv
        echo "Created native venv at .venv. (Tip: Installing 'uv' will make this much faster!)"
    else
        echo "Error: python3 is not available. Cannot initialize python environment." >&2
        exit 1
    fi
fi

# 4. Initialize Git and Git Flow if requested
if [[ "$use_git" == "true" ]]; then
    init_git "$project_dir" "$use_git_flow"
fi

echo "Done. Python project initialized at: $project_dir"
