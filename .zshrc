# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load all custom configurations from the .zsh_config directory
if [ -d ~/.zsh_config ]; then
  for config_file in ~/.zsh_config/*.zsh; do
    source "$config_file"
  done
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autocomplete)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh
