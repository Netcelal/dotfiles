DEFAULT_USER=cbasar
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_ALL="en_US.UTF-8"

# DISABLE_AUTO_UPDATE="true"

# export UPDATE_ZSH_DAYS=13


# zsh-autosuggestions plugin
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-autosuggestions.zsh
# Fix zsh autosuggestions keybind for arrow keys
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# aliases
alias remotedebugiphone="remotedebug_ios_webkit_adapter --port=9000"
alias sshon="sudo systemsetup -setremotelogin on"
alias sshoff="sudo systemsetup -setremotelogin off"
alias cl="clear"
alias ls="lsd"
alias cat="bat"
alias less="bat"
alias lg="lazygit"
alias td="todo.sh"
alias vim="nvim"
alias v="nvim"
alias t="tmux"
alias tup="~/.tmux/tup.sh"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias todo="todo.sh"

# git alias
alias g='git'
alias gsb='git status -sb'
alias gst='git status'
alias ga='git add'
alias gb='git branch'
alias gcm='git commit -m'

alias gsw='git switch'
alias gswc='git switch -c'

alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

# Run tmux on startup
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new -s default -n zsh
fi

# Configure fzf
if [[ -x "$(command -v fzf)" ]] && [[ -x "$(command -v bat)" ]]; then
  alias fp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
fi

# Use 256colors inside TMUX
if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/usr/local/share/python/:/Users/cbasar/Library/Python/2.7/lib/python/:$PATH"
export PATH="/usr/local/sbin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set nvim as the default editor
export EDITOR=nvim

# To customize prompt
eval "$(starship init zsh)"
