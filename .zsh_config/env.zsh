# Initialize the Homebrew environment for the current shell session
function init_homebrew() {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Run the function to configure Homebrew
init_homebrew
