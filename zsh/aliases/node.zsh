# Yarn - project commands
alias ys='yarn start'
alias yt='yarn test'
alias yb='yarn build'
alias yd='yarn dev'
alias yl='yarn lint'

# Yarn - package management
alias ya='yarn add'
alias ye='yarn remove'
alias yi='yarn install'
alias yg='yarn upgrade'

# NPM
alias npmi='npm install'
alias npmr='npm run'
alias npms='npm start'
alias npmt='npm test'
alias npmd='npm run dev'

# NVM
alias nvmi='nvm install'
alias nvmu='nvm use'
alias nvml='nvm ls'

# Handy
alias npmscripts='cat package.json | jq .scripts'
alias nodesize='du -sh node_modules'
alias yv='print_node_versions'
alias yarn-nuke='reinstall_modules'

# Auto-switch Node version when entering a directory with .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path=".nvmrc"
  if [[ -f $nvmrc_path ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

# Remove node_modules and lock files, then reinstall
reinstall_modules() {
  if read -q "choice?Remove and reinstall all node_modules? (y/N)"; then
    echo
    project_dir=$(pwd)
    check-and-remove() {
      if [ -d "$project_dir/$1" ]; then
        echo -e "\e[35mRemoving $1...\e[0m"
        rm -rf "$project_dir/$1"
      fi
    }
    check-and-remove 'node_modules'
    check-and-remove 'yarn.lock'
    check-and-remove 'package-lock.json'
    if hash 'yarn' 2> /dev/null; then
      yarn
    elif hash 'npm' 2> /dev/null; then
      npm install
    else
      echo -e "🚫 yarn/npm not installed"
    fi
  else
    echo -e "\n\033[0;91mAborting...\e[0m"
  fi
}

# Print versions of installed Node tooling
print_node_versions() {
  versions=''
  format_verion_number() { echo "$($1 --version 2>&1 | head -n 1 | sed 's/[^0-9.]*//g')"; }
  get_version() {
    if hash $1 2> /dev/null || command -v $1 >/dev/null; then
      versions="$versions\e[36m\e[1m $2: \033[0m$(format_verion_number $1) \n\033[0m"
    else
      versions="$versions\e[33m\e[1m $2: \033[0m\033[3m Not installed\n\033[0m"
    fi
  }
  get_version 'node' 'Node.js'
  get_version 'npm' 'NPM'
  get_version 'yarn' 'Yarn'
  get_version 'nvm' 'NVM'
  get_version 'pnpm' 'pnpm'
  get_version 'bun' 'Bun'
  echo -e $versions
}

# Location of NVM
NVM_DIR=${NVM_DIR:-$XDG_DATA_HOME/nvm}

# Lazy-load NVM on first use of node/npm/yarn
function source_nvm node npm yarn $NVM_LAZY_CMD {
  if [ -f "$NVM_DIR/nvm.sh" ] && ! which nvm &> /dev/null; then
    echo -e "\033[1;93mInitialising NVM...\033[0m"
    source "${NVM_DIR}/nvm.sh"
    nvm use default
  fi
  unfunction node npm yarn source_nvm $NVM_LAZY_CMD
  hash "$0" 2> /dev/null && command "$0" "$@"
}

# Enable Corepack/Yarn if not yet available
enable_corepack() {
  if ! hash 'yarn' 2> /dev/null && hash 'corepack' 2> /dev/null; then
    echo -e "\033[1;93mEnabling Corepack...\033[0m"
    corepack enable
  fi
}

yarn_wrapper() {
  if ! hash 'yarn' 2> /dev/null; then
    echo "Yarn not found, enabling Corepack..."
    enable_corepack
  fi
  yarn "$@"
}
alias yarn='yarn_wrapper'
