# Load Powerlevel10k prompt theme configuration.

# This checks if the p10k configuration file exists before loading it.
if [[ -f "$HOME/.p10k.zsh" ]]; then
  source "$HOME/.p10k.zsh"
fi

# This optional line prevents the p10k configuration wizard from running automatically.
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
