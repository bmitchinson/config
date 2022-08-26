# https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961

# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    asdf
    zsh-autosuggestions
    # must be last
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source "${ZSH}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"
source "${ZSH}/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZSH}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_DISABLE_COMPFIX="true"

# Preferred editor for local and remote sessions
export EDITOR='code'
# if [[ -n $SSH_CONNECTION ]]; then
  # export EDITOR='vim'
# else
  # export EDITOR='mvim'
# fi

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DIR_HOME_BACKGROUND='lightskyblue1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='skyblue3'
POWERLEVEL9K_DIR_NOT_WRITEABLE_BACKGROUND='lightcoral'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='lightslateblue'
POWERLEVEL9K_DIR_ETC_BACKGROUND='lightslateblue'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='chartreuse4'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='mediumorchid'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='indianred'

configzsh() {
  code ~/.zshrc_no_sync
  code ~/.zshrc
}
reloadzsh() {
  source ~/.zshrc
}
alias gitconfig='code ~/.gitconfig'
alias npmglobal='npm ls -g --depth 0'
alias o='open .'
alias c='clear'
alias dps='docker ps'
alias pub='pbcopy < ~/.ssh/id_rsa.pub'
alias ip='ipconfig getifaddr en0'
alias beep='echo -e "\a"'
alias tf='terraform'
alias kc='kubectl'
# alias vpnconnect='sudo openconnect --user bmitchinson --authgroup DUO --protocol=anyconnect vpn-sf.vailsys.com'

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

bashdocker() {
  docker exec -it $1 /bin/sh
}

# Postgres
alias startpsql='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppsql='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

export EDITOR="/usr/bin/nano"

# Path
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Version Managers + Brew
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"

# NVM Defaults
defaultnvm() {
  nvm alias default $1 && nvm use default
}

letme(){
  sudo spctl --master-disable
}

dontletme(){
  sudo spctl --master-enable
}

alias repos="~/repos"
alias home="~"

pause() {
  read -s -k '?Press any key to continue.'
}

backupconfig() {
  zsh ~/repos/config/scripts/backup.sh
}

restoreconfig() {
  zsh ~/repos/config/scripts/restore.sh
}

source ~/.zshrc_no_sync