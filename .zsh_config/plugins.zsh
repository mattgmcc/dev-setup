# Load Zsh plugins for syntax highlighting and autosuggestions.

# This plugin highlights commands in the terminal as you type them.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# This plugin suggests commands based on your history, which you can accept with the arrow key.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load fzf (fuzzy finder) if its configuration file exists.
# fzf adds powerful search capabilities (like Ctrl+R for history search).
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi
