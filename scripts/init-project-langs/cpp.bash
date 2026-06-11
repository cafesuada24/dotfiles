#!/usr/bin/env bash
# ==============================================================================
# C++ Project Initializer
# File: init-project-langs/cpp.bash
#
# Generates a standard C++ project workspace with include/src/tests structure,
# configured CMakeLists.txt, Makefile, clangd setup, gitignore, and Git/Git Flow.
# ==============================================================================

# Source common utilities (paths, git init, yes/no prompt)
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/utils.bash" || exit 1

# 1. Interactive Prompts
read -p "Directory name (default current directory): " dir_input
read -p "Cpp standard (default 20): " cpp_std
cpp_std="${cpp_std:-20}"

use_git=false
use_git_flow=false

if prompt_yes_no "Use git? ([y]/n) " "y"; then
    use_git=true
    if prompt_yes_no "Use git flow? ([y]/n) " "y"; then
        use_git_flow=true
    fi
fi

# 2. Resolve and Create Project Directory
project_dir=$(resolve_project_dir "$dir_input") || exit 1
cd "$project_dir" || exit 1

# Extract directory basename for the project/namespace name
proj_name="${PWD##*/}"
# Convert directory name to PascalCase (e.g. my-project -> MyProject)
proj_name_normalized=$(echo "$proj_name" | sed -E 's/(^|_|-)(.)/\U\2/g')

# 3. Create Standard C++ Workspace Folders and Files
mkdir -p include/"$proj_name" src tests
touch README.md

# Validate templates existence
if [[ ! -d "$TEMPLATES_DIR" ]]; then
    echo "Error: Templates directory not found at $TEMPLATES_DIR" >&2
    exit 1
fi

# Copy template configurations
for t in gitignore.cpp Makefile clangd CMakeLists.txt; do
    if [[ ! -f "$TEMPLATES_DIR/$t" ]]; then
        echo "Error: Template file $TEMPLATES_DIR/$t not found." >&2
        exit 1
    fi
done

cp "$TEMPLATES_DIR/gitignore.cpp" .gitignore
cp "$TEMPLATES_DIR/Makefile" .

# Copy template configurations and render dynamic placeholders
render_template "$TEMPLATES_DIR/clangd" .clangd \
    "CPP_STANDARD=$cpp_std"

render_template "$TEMPLATES_DIR/CMakeLists.txt" CMakeLists.txt \
    "PROJECT_NAME=$proj_name_normalized" \
    "CPP_STANDARD=$cpp_std"

# 4. Initialize Git and Git Flow if requested
if [[ "$use_git" == "true" ]]; then
    init_git "$project_dir" "$use_git_flow"
fi

echo "Done. C++ project initialized at: $project_dir"
