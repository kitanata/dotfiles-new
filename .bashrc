export EDITOR=vim
export GIT_DUET_GLOBAL=true
export NVM_DIR="$HOME/.nvm"

source ~/.aliases
source ~/.git-completion.bash

eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  PROMPT_USER_AND_HOST='\[\033[01;32m\]\u@\h'
  PROMPT_PWD='\[\033[01;34m\]\w\[\033[00m\]'
  GIT_PROMPT_START="${PROMPT_USER_AND_HOST}:${PROMPT_PWD}"
  GIT_PROMPT_END=' $ '
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

wtf() {
    watch -n 3 -c $1
}

rubytags() {
    ripper-tags -R --exclude=vendor
}

jstags() {
    ctags -R --exclude=.git --exclude=node_modules
}

rbdev() {
    rails db:environment:set RAILS_ENV=development
}
