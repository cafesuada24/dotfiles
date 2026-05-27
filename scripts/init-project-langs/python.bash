TEMPLATES_DIR=$DOTFILES/templates

read -p "Directory name (default current directory): " dir 
read -p "Use git? ([y]/n) " use_git
read -p "Python version (default 3.12): " python_version


if [[ -z $python_version ]]; then
    python_version="3.12"
fi

if [[ -z $use_git ]]; then
    use_git='y'
fi

if [[ -z $dir ]]; then
    dir=$(pwd)
else
    mkdir -p $dir
    dir="$(pwd)/$dir"
fi

cd $dir

cp $TEMPLATES_DIR/gitignore.python .gitignore

try_init_git_flow() {
    read -p "Use git flow? ([y]/n) " use_git_flow
    if [[ -z $use_git_flow ]]; then
        use_git_flow='y'
    fi

    case $use_git_flow in
        [yY] ) git flow init;; 
        [nN] ) ;;
    * ) echo "Invalid option";;
    esac

}

case $use_git in
    [yY] ) try_init_git_flow && uv init --vcs git --author-from git --python $python_version;;
    [nN] ) uv init --vcs none --author-from auto --python $python_version;;
    * ) echo "Invalid option";;
esac

tail -n +8 $TEMPLATES_DIR/pyproject.toml >> pyproject.toml

uv venv

echo "Done."
