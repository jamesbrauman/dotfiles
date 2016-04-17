# default exports
export ZSH=~/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LANG=en_US.UTF-8

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# zsh configuration
ZSH_THEME="fwalch"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"

# zsh plugins
plugins=(git rails docker colored-man-pages docker)

# source zsh
source $ZSH/oh-my-zsh.sh

# aliases
alias nano="vim" # bad james
alias tmux="TERM=xterm-256color tmux" # moar colorz

# more aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# command exists
command_exists () {
  type "$1" &> /dev/null
}

# directory exists
directory_exists() {
  -d "$1"
}

# common things
if [ -f /vagrant/common.rc ]; then
  . /vagrant/common.rc
fi

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"

  bx () { if [[ $1 == "bp" ]]; then command shift && $HOME/.rbenv/shims/bundle exec bluepill --no-privileged "$@"; else command $HOME/.rbenv/shims/bundle exec "$@"; fi; }
fi

# nvm
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm alias default node &> /dev/null
fi
