# navigation
alias home='~'
alias desktop='~/Desktop'
alias cnvim='~/.config/nvim'
alias czsh='~/.zsh'
alias nvzsh='nvim ~/.zshrc'
alias cdzsh='code ~/.zshrc'
alias mkdir='mkdir -p'
mkdircd() { mkdir -p "$1" && "$1"; }

# file operations
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -lh'
alias lsa='ls -la'
alias grep='grep --color=auto'

# shell
alias c='clear'
alias h='history'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
