# Basics
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias gf="git fetch"
alias gcl="git clone"

# Branching & viewing
alias gco="git checkout"
alias gcomtgpl="gco master; gpl"
alias gcomngpl="gco main; gpl"
alias gb="git branch"
alias gd="git diff"
alias gl='git log'
alias gtree="git log --graph --oneline --decorate --abbrev-commit"

# Merging and Rebasing
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias gm="git merge"

# Undoing
alias gua="git reset --hard HEAD"

# Navigate to repo root
function jump-to-git-root {
  local _root_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [[ $? -gt 0 ]]; then
    >&2 echo 'Not a Git repo'
    exit 1
  fi
  local _pwd=$(pwd)
  if [[ $_pwd = $_root_dir ]]; then
    _root_dir="$(git -C $(dirname $_pwd) rev-parse --show-toplevel 2>/dev/null)"
    if [[ $? -gt 0 ]]; then
      echo "Already at Git repo root."
      return 0
    fi
  fi
  OLDPWD=$_pwd
  echo "Git repo root: $_root_dir"
  cd $_root_dir
}
alias gj='jump-to-git-root'

# Commit with message (prompts if none given)
function gcommit {
  commit_msg=$@
  if [ $# -eq 0 ]; then
    echo 'Enter a commit message'
    read commit_msg
  fi
  git commit -m "$commit_msg"
}
alias gcm="gcommit"

# Open current repo/branch in GitHub
get-repo-url() {
  git_base_url='https://github.com'
  git_url=${$(git config --get remote.origin.url)%.git}
  if [[ $git_url =~ ^git@ ]]; then
    branch=${1:-"$(git symbolic-ref --short HEAD)"}
    branchExists="$(git ls-remote --heads $git_url $branch | wc -l)"
    github="$(echo $git_url | sed 's/git@//')"
    github="$(echo $github | sed 's/\:/\//')"
    if [[ $branchExists == "       1" ]]; then
      git_url="http://$github/tree/$branch"
    else
      git_url="http://$github"
    fi
  elif [[ $git_url =~ ^https?:// ]]; then
    branch=${1:-"$(git symbolic-ref --short HEAD)"}
    branchExists="$(git ls-remote --heads $git_url $branch | wc -l)"
    if [[ $branchExists == "       1" ]]; then
      git_url="$git_url/tree/$branch"
    fi
  fi
  echo $git_url
}

open-github() {
  git_base_url='https://github.com'
  if [[ ! -z $1 && ! -z $2 ]]; then
    git_url=$git_base_url/$1/$2
  elif git rev-parse --git-dir > /dev/null 2>&1; then
    git_url=$(get-repo-url)
  else
    git_url=$git_base_url
  fi
  echo -e "\033[1;96mOpening: \033[0;96m\e[4m$git_url\e[0m"
  open $git_url
}
alias gho='open-github'
