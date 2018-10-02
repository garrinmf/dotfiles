alias vi="mvim -v"
alias vim="mvim -v"
alias md5sum="md5 -r"
alias sshhome="ssh -f -N hometunnel"
alias tmux="TERM=xterm-256color tmux"
alias mux="tmuxinator"

alias g="git"
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|staging|production)\s*$)" | command xargs -n 1 git branch -d'
alias up="git checkout master && git fetch upstream && git rebase upstream/master && git push origin master"
alias oup="git checkout master && git fetch origin && git rebase origin/master"
alias gf="git fetch"

alias ctags="`brew --prefix`/bin/ctags"
alias rmorig="find . -name \"*.orig\" -exec rm {} \\;"
alias clapi="rm -rf public/uploads/* && :> log/test.log && :> log/development.log"

alias dcr="docker-compose run --service-ports --rm app"
alias dss="docker-sync-stack start"
alias dcb="docker-compose build"
alias dcp="docker-compose pull"
alias docker-rmrf='docker rm -f $(docker ps -a -q)'
alias docker-stopall='docker stop $(docker ps -q)'
alias docker-rmall='docker rm $(docker ps -a -q)'
alias docker-clean='docker rmi $(docker images -q -f dangling=true)'
alias docker-time='docker run -it --rm --privileged --pid=host garrinmf/rsf nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)'

function dcc() {
  if [ "$1" != "" ]
  then
    docker exec -it "$1"_app_1 /bin/bash
  fi
}

function drcc() {
  if [ "$1" != "" ]
  then
    docker exec -it "$1"_app_run_1 /bin/bash
  fi
}
