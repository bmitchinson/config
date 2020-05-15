# https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
# Zsh Config
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/Users/bmitchinson/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bmitchinson/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DIR_HOME_BACKGROUND='lightskyblue1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='skyblue3'
POWERLEVEL9K_DIR_NOT_WRITEABLE_BACKGROUND='lightcoral'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='lightslateblue'
POWERLEVEL9K_DIR_ETC_BACKGROUND='lightslateblue'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='palegreen3'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='mediumorchid'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='indianred'

alias zshconfig='code ~/.zshrc'
alias gitconfig='code ~/.gitconfig'
alias npmglobal='npm ls -g --depth 0'
alias o='open .'
alias c='clear'
alias dp='docker ps'
alias pub='pbcopy < ~/.ssh/id_rsa.pub'
alias ip='ipconfig getifaddr en0'

# Projects
alias haiti='cd ~/repos/hdhs'
alias sep='cd ~/repos/sep'

# Haiti
alias bashhaiti='docker exec -it haiti_pwa bash'

# Docker Generic
# https://stackoverflow.com/a/42116347/10007258
rmcontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

# https://stackoverflow.com/a/42116347/10007258
nukedocker() {
    rmcontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

# Haiti
alias starthaiti='docker-compose -f ~/repos/hdhs/dev-docker-compose.yml up'
alias killhaiti='docker-compose -f ~/repos/hdhs/dev-docker-compose.yml down'

alias ppc='cd ~/repos/ppc'
alias ppctheme='cd ~/repos/ppc/app/docroot/themes/custom/ppc'
alias startppc='docker-compose -f docker-compose-local.yml up -d'
alias bashppc='docker exec -it ppc_d8 bash'
alias killppc='docker kill ppc_d8 ppc_d8_db'

# Classes
alias plc='cd ~/repos/plc'
alias os='cd ~/repos/os/hw2/bmitchinson'
function runsep {
  npx cypress run --spec "$1"
}

# Postgres
alias startpsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppsql='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


# Version Managers
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:"/Users/bmitchinson/Library/Python/3.8/bin"
export PATH=$PATH:"/Applications/Emacs.app/Contents/MacOS"
export PATH=$PATH:"~/repos/plc/ial"
export PATH=$PATH:"~/bin"
export EDITOR="/usr/bin/nano"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "SUP NERD."
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# added by travis gem
[ -f /Users/bmitchinson/.travis/travis.sh ] && source /Users/bmitchinson/.travis/travis.sh
