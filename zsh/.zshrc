export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-interactive-cd zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/aliases/docker.zsh
source ~/.zsh/aliases/git.zsh
source ~/.zsh/aliases/kubectl.zsh
source ~/.zsh/aliases/node.zsh
source ~/.zsh/aliases/python.zsh

export VOLTA_HOME=~/.volta
export PATH="$VOLTA_HOME/bin:$PATH"

# Requires Angular CLI installed globally: npm install -g @angular/cli
source ~/.zsh/ng-completion.zsh

# Apple Silicon — update paths for Intel (/usr/local) or Linux
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@18/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@18/include"

# Lazy-load NVM to avoid slow shell startup; Apple Silicon path
export NVM_DIR=~/.nvm
nvm() {
  unset -f nvm node npm npx
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  nvm "$@"
}
node() { nvm; node "$@"; }
npm()  { nvm; npm "$@"; }
npx()  { nvm; npx "$@"; }
