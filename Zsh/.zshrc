export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/zsh-custom"
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto # just remind me to update when it's time

plugins=(
  git
  kubectl
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim
alias vi=nvim

[ -z "$TMUX"  ] && { exec tmux new-session && exit;}
