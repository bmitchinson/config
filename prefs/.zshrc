# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE

# https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
# Zsh Config
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/Users/bmitchinson/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bmitchinson/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
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

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='palegreen3'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='mediumorchid'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='indianred'

DEV_DATABASE_URL=postgres://bmitchinson:asdf@127.0.0.1:port/blueberry_dev

alias zshconfig='code ~/.zshrc'
alias gitconfig='code ~/.gitconfig'
alias npmglobal='npm ls -g --depth 0'
alias o='open .'
alias c='clear'
alias dp='docker ps'
alias pub='pbcopy < ~/.ssh/id_rsa.pub'
alias ip='ipconfig getifaddr en0'
alias beep='echo -e "\a"'
alias vpnconnect='sudo openconnect --user bmitchinson --authgroup DUO --protocol=anyconnect vpn-sf.vailsys.com'

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
# export PATH=$PATH:"~/bin"

# Version Managers + Brew
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"

# NVM Defaults
# alias vailnvm='nvm alias default 14.3.0 && nvm use default'
alias grazenvm='nvm alias default 12 && nvm use default'
alias mitchinsonnvm='nvm alias default 12.22.1 && nvm use default'

grazelinks() {
    open 'https://docs.google.com/spreadsheets/d/1btJkawaXHtMJcSUJZaKFjtDi29ryrhH0FzhhQb2LHv0/edit?ts=5ebdb402#gid=1769408458'
    open https://grazeanalytics.atlassian.net/jira/software/projects/GRZ/boards/24
    open http://localhost:3001
}

vaillinks() {
    open 'https://tickets.vailsys.com/secure/RapidBoard.jspa?rapidView=741'
    open 'https://gitlab.vailsys.com/wavrunner/web'
}

workgraze() {
    cd ~/repos/graze/apricot-blueberry
    grazenvm
    code apricot
    code blueberry
    grazelinks
    open -a GitKraken
    open -a Notion
    open -a Slack
    ttab -G eval "cd blueberry/scripts; ./reset_db_local_dev.sh"
    ttab -G eval "cd apricot; export PORT=3000; npm run start"
}

postvail() {
    open -a "Sublime Text" ~/repos/personal/Mitchinson.dev/source/_posts/vail-march-2021.md
}

alias planttext="open ~/Documents/PlantText/guide.pdf"

alias worksite='open notion://www.notion.so/bmitchinson/mitchinson-dev-a71704b052744c6598407d83235b5a0b'

echo "SUP NERD."
