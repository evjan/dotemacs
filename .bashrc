# export PATH="~/bin:/usr/local/bin:$PATH"
export PATH="~/bin:~/:$PATH"
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export EDITOR='emacs'

alias be='bundle exec'
alias bfs='bundle exec foreman s'
alias ct='ctags -R *'
alias ll='ls -alFh'
alias vicl='find . -name *.*~ -ok rm {} \;'

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
