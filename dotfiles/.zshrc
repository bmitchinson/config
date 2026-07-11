# Anything in this file is public. Personal secrets or values should not be placed here.

# Preferred editor for local and remote sessions
export EDITOR='zed'

##########################################
##### PATH
export PATH="$HOME/repos/personal/config/scripts:$PATH"
export PATH="/Users/bmitchinson/.local/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/Developer/PlaydateSDK/bin/:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Users/bmitchinson/.deno/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

##########################################
##### ZSH
# https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961

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

# bun completions
[ -s "/Users/bmitchinson/.bun/_bun" ] && source "/Users/bmitchinson/.bun/_bun"

ZSH_DISABLE_COMPFIX="true"

ENABLE_CORRECTION="false"
DISABLE_CORRECTION="true"
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
##########################################

##########################################
#### Shortcuts
reloadzsh() {
  source ~/.zshrc
}
alias editzsh='zed ~/.zshrc'
alias editghostty='zed $HOME/.config/ghostty/config'
alias editpi='zed ~/.pi'

alias npmglobal='npm ls -g --depth 0'
alias bunglobal='bun pm ls -g'

alias o='open .'
alias c='clear'
namespace() {
  if [[ -z "$HERDR_ENV" || -z "$HERDR_WORKSPACE_ID" ]]; then
    echo "namespace: not running inside Herdr" >&2
    return 1
  fi
  if [[ $# -eq 0 ]]; then
    echo "usage: namespace <name>" >&2
    return 2
  fi
  herdr workspace rename "$HERDR_WORKSPACE_ID" "$*"
}
nametab() {
  if [[ -z "$HERDR_ENV" || -z "$HERDR_TAB_ID" ]]; then
    echo "nametab: not running inside Herdr" >&2
    return 1
  fi
  if [[ $# -eq 0 ]]; then
    echo "usage: nametab <name>" >&2
    return 2
  fi
  herdr tab rename "$HERDR_TAB_ID" "$*"
}
alias lg='nametab lazygit && lazygit'
alias dps='docker ps'

alias beep='echo -e "\a"'

alias game='wakeonlan d8:bb:c1:8e:8d:aa'

alias startmagic='brew services start rconroy293/seventeenlands/seventeenlands'
alias killmagic='brew services stop rconroy293/seventeenlands/seventeenlands'

alias sshchao='TERM=xterm-256color ssh -p 222 root@100.90.15.4'
alias sshchaodirect='TERM=xterm-256color ssh -p 222 root@10.0.0.211'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

alias cpi="cd ~ && pi"
alias qpi="pi --model gpt-5.4-mini -p"

alias stopherdr="herdr server stop"

# Theme toggles
alias lightmode="$HOME/scripts/displaymode light"
alias darkmode="$HOME/scripts/displaymode dark"

setnode() {
  nvm alias default $1 && nvm use default
}

bashdocker() {
  docker exec -it $1 /bin/sh
}

helpcommittime() {
  echo "git commit --date=\"6:00pm\" -m \"Mobile mode switch complete\""
}

nr() {
  npm run $1 -- $2
}

br() {
  bun run --bun $1 -- $2
}

##########################################
#### Utils
pause() {
  read -s -k '?Press any key to continue.'
}

findport() {
  lsof -i tcp:$1
  echo "kill -9 <PID>"
}
##########################################
#### Version Managers + Brew
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(jenv init -)"
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(zoxide init zsh)"

if [[ -z "$HERDR_ENV" ]]; then
  herdr
fi
##########################################
