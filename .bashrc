# export PATH="~/bin:/usr/local/bin:$PATH"
export PATH="~/bin:~/bin/activator-1.2.10-minimal/:$PATH"
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export EDITOR='emacs'

source  /opt/boxen/env.sh

alias be='bundle exec'
alias bfs='bundle exec foreman s'
alias ct='ctags -R *'
alias ll='ls -alFh'
alias vicl='find . -name *.*~ -ok rm {} \;'

alias ebe='bundle exec rake workers:export_queue RAILS_ENV=development FILE=~/errors.json QUEUE=background_workers_errors'
alias ee='vim ~/errors.json'
alias efe='bundle exec rake workers:export_queue RAILS_ENV=development FILE=~/errors.json QUEUE=fulfillment_workers_errors'
alias ete='bundle exec rake workers:export_queue RAILS_ENV=development FILE=~/errors.json QUEUE=transfer_workers_errors'
alias ie='bundle exec rake workers:import_queue RAILS_ENV=development  FILE=~/errors.json'
alias lq='rabbitmqctl -n rabbit@localhost list_queues'
alias lqe='rabbitmqctl -n rabbit@localhost list_queues | grep errors'
alias rme='rm -v ~/errors.json'
alias wq='watch --interval 1 rabbitmqctl -n rabbit@localhost list_queues'

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

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
function proml {
  case $TERM in
    xterm*)
      TITLEBAR='\[\033]0;${PWD##*/}\007\]'
      ;;
    *)
      TITLEBAR=''
      ;;
  esac
  PS1="${TITLEBAR}\w \$(parse_git_branch)\$ "
  PS2='> '
  PS4='+ '
}
proml
unset proml

set -o noclobber # Don't allow overwriting existing files unless you're using the >|
