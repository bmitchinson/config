# https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
# Zsh Config
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/Users/bmitchinson/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bmitchinson/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

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

# Postgres
alias startpsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppsql='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

export EDITOR="/usr/bin/nano"
export PSQL_USERNAME="bmitchinson"

# Path
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:"/Users/bmitchinson/Library/Python/3.8/bin"
export PATH=$PATH:"~/bin"

# Version Managers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "SUP NERD."
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# added by travis gem
[ -f /Users/bmitchinson/.travis/travis.sh ] && source /Users/bmitchinson/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
