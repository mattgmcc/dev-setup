# Load NVM (Node Version Manager)
function setup_nvm() {
  export NVM_DIR="$HOME/.nvm"
  
  # Source the main NVM script if it exists
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
  fi
  
  # Source the NVM bash completion script if it exists
  if [ -s "$NVM_DIR/bash_completion" ]; then
    source "$NVM_DIR/bash_completion"
  fi
}

# Run the function to set up NVM
setup_nvm


# Load pyenv (Python Version Manager)
function setup_pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  
  # Add pyenv to the PATH if the directory exists
  if [[ -d "$PYENV_ROOT/bin" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
  fi
  
  # Initialize pyenv shims
  eval "$(pyenv init - zsh)"
}

# Run the function to set up pyenv
setup_pyenv


# Load jenv (Java Version Manager)
function setup_jenv() {
  # Initialize jenv shims and functions
  eval "$(jenv init -)"
}

# Run the function to set up jenv
setup_jenv
