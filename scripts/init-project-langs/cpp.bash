#!/usr/bin/env bash

TEMPLATES_DIR=$DOTFILES/templates

read -p "Directory name (default current directory): " dir 
read -p "Cpp standard (default 20): " cpp_std
read -p "Use git? ([y]/n) " use_git

if [[ -z $cpp_std ]]; then
    cpp_std="20"
fi

if [[ -z $use_git ]]; then
    use_git='y'
fi

if [[ -z $dir ]]; then
    dir=$(pwd)
else
    shopt -s extglob
    dir="${dir//+([[:space:]])/-}"
    dir="${dir,,}"
    mkdir -p $dir
    dir="$(pwd)/$dir"
fi

cd $dir

try_init_git_flow() {
    read -p "Use git flow? ([y]/n) " use_git_flow
    if [[ -z $use_git_flow ]]; then
        use_git_flow='y'
    fi

    git init
    git add .
    git commit -m "Initial commit" &> /dev/null

    case $use_git_flow in
        [yY] ) git flow init;; 
        [nN] ) ;;
        * ) echo "Invalid option";;
    esac

}

proj_name="${PWD##*/}"

# Convert to snakecase
proj_name_normalized=$(echo $proj_name | sed -E 's/(^|_|-)(.)/\U\2/g')

mkdir -p include/${proj_name} src tests
touch README.md
cp $TEMPLATES_DIR/gitignore.cpp .gitignore
CPP_STANDARD=$cpp_std envsubst < $TEMPLATES_DIR/clangd > .clangd
PROJECT_NAME=$proj_name_normalized CPP_STANDARD=$cpp_std envsubst < $TEMPLATES_DIR/CMakeLists.txt > CMakeLists.txt

case $use_git in
    [yY] ) try_init_git_flow;;
    [nN] ) ;;
    * ) echo "Invalid option";;
esac

echo "Done."
