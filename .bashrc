# export PATH="~/bin:/usr/local/bin:$PATH"
export PATH="~/bin:$PATH"
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export EDITOR='vim'

source  /opt/boxen/env.sh

alias be='bundle exec'
alias ll='ls -alFh'

git config --global alias.a 'add'
git config --global alias.aa 'add --all .'
git config --global alias.ap 'add -p'
git config --global alias.ci 'commit'
git config --global alias.cl 'clean -fd'
git config --global alias.co 'checkout'
git config --global alias.d 'diff'
git config --global alias.ds 'diff --staged'
git config --global alias.l 'log'
git config --global alias.lp 'log -p'
git config --global alias.p 'push'
git config --global alias.pr 'pull --rebase'
git config --global alias.rh 'reset HEAD'
git config --global alias.s 'status'
git config --global alias.st 'stash'
git config --global alias.stp 'stash pop'

export RSTUDIO_WHICH_R=/opt/boxen/homebrew/bin/R

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
