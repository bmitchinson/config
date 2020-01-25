# Zsh Config
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bmitchinson/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DIR_HOME_BACKGROUND='lightskyblue1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='skyblue3'
POWERLEVEL9K_DIR_NOT_WRITEABLE_BACKGROUND='lightcoral'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='lightslateblue'
POWERLEVEL9K_DIR_ETC_BACKGROUND='lightslateblue'

alias zshconfig='code ~/.zshrc'
alias gitconfig='code ~/.gitconfig'
alias npmglobal='npm ls -g --depth 0'
alias o='open .'
alias c='clear'
alias dp='docker ps'
alias pub='pbcopy < ~/.ssh/id_rsa.pub'

# PPC
alias linode='ssh ben@50.116.22.151'
alias ppc='cd ~/repos/ppc'
alias ppctheme='cd ~/repos/ppc/ppc_d8/app/docroot/themes/custom/ppc'
alias startppc='docker-compose -f docker-compose-local.yml up -d'
alias bashppc='docker exec -it ppc_d8 bash'
alias killdocker='docker kill ppc_d8 ppc_d8_db'
alias cleardocker='docker rm -f $(docker ps -a -q)'

# PPC SQL
alias dumps='cd ~/repos/ppc/ppc_d8/app/docroot/db_dumps'
function copydump {
  scp ben@50.116.22.151:/var/www/containers/dev.ppc.uiowa.edu/app/docroot/db_dumps/$1 $1
}
function importdump {
  docker exec -i ppc_d8_db sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" ppc_drupal' < ./$1
}

# Classes
alias plc='cd ~/repos/plc'

# Version Managers
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(pyenv init -)"

# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "SUP NERD."
