# export PATH="~/bin:/usr/local/bin:$PATH"
export PATH="~/bin:$PATH"
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export EDITOR='vim'

source  /opt/boxen/env.sh

alias be='bundle exec'
alias ga='git add'
alias gaa='git add --all .'
alias gap='git add -p'
alias gci='git commit'
alias gcl='git clean -fd'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log'
alias glp='git log -p'
alias gp='git push'
alias gpr='git pull --rebase'
alias grh='git reset HEAD'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'
alias ll='ls -alF'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
