# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh/custom"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
[ -z "$GITHUB_NPM_TOKEN" ] && export GITHUB_NPM_TOKEN="foo"
[ -z "$NPM_TOKEN" ] && export NPM_TOKEN="foo"

# Load all files from .shell/zshrc.d directory
if [ -d $HOME/.shellrc/zshrc.d ]; then
  for file in $HOME/.shellrc/zshrc.d/*.zsh; do
    source $file
  done
fi

# Load all files from .shell/rc.d directory
if [ -d $HOME/.shellrc/rc.d ]; then
  for file in $HOME/.shellrc/rc.d/*.sh; do
    source $file
  done
fi


export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi

if hash thefuck 2>/dev/null; then
  eval $(thefuck --alias)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.env.sh ] && source ~/.env.sh
hash ruby 2>/dev/null && PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${PATH}:${SONAR_SCANNER_HOME}/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
