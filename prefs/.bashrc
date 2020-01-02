[ -d "Documents/GitHub" ] && cd Documents/GitHub
echo "SUP NERD."
export PATH=$PATH:/usr/bin/start
alias bashconfig='code ~/.bash_profile'
alias gitconfig='code ~/.gitconfig'
alias npmglobal='npm ls -g --depth 0'
alias pub='pbcopy < ~/.ssh/id_rsa.pub'

# ppc project shortcuts
alias codeconfig='code ~/repos/ppc/ppc_drupal_dockerconfig/'
alias codetheme='code ~/repos/ppc_drupal_dockerconfig/app/docroot/themes/custom/ppc/'
alias codelayout='code ~/repos/ppc_drupal_dockerconfig/app/docroot/modules/custom/ppc_layouts/'
alias bashppc='docker exec -it ppc_d8 bash'
alias startppc='docker-compose -f docker-compose-local.yml up -d'
alias cleardocker='docker rm -f $(docker ps -a -q)'

export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool FALSE
