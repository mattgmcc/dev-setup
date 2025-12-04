# desc: Interactively search for a file/directory and open it in VS Code.
function search() {
  # Run fzf and store the selected path in a variable named 'selection'.
  local selection=$(fzf -e --preview 'if [[ -d {} ]]; then tree -C -L 2 {}; else bat --color=always --style=numbers --line-range=:500 {} || cat {}; fi')
  
  # If a selection was made (the variable is not empty), open it with 'code'.
  if [[ -n "$selection" ]]; then
    code "$selection"
  fi
}

# desc: Interactively search within ~/IdeaProjects and open the selection in VS Code.
function search_repos() {
  # Find files, pipe to fzf, and store the selection.
  local selection=$(find ~/IdeaProjects | fzf -e --preview 'if [[ -d {} ]]; then tree -C -L 2 {}; else bat --color=always --style=numbers --line-range=:500 {} || cat {}; fi')
  
  # If a selection was made, open it with 'code'.
  if [[ -n "$selection" ]]; then
    code "$selection"
  fi
}

  # Use 'find' with -maxdepth 1 to show only the top-level repo directories.
  local selection=$(find ~/IdeaProjects -maxdepth 1 -mindepth 1 -type d | fzf -e)
  
  # If a directory was selected, open it with 'code'.
  if [[ -n "$selection" ]]; then
    code "$selection"
  fi
}

# desc: Interactively search and switch to a git branch using fuzzy matching.
function gfb() {
  # Get all branches, clean up the output, and pipe to fzf for fuzzy searching.
  local branch=$(git branch --all | sed 's/^\*//;s/remotes\/origin\///' | fzf)
  
  # Checkout the branch if one was selected.
  if [[ -n "$branch" ]]; then
    # Use xargs to trim any leading/trailing whitespace before checking out.
    git checkout "$(echo "$branch" | xargs)"
  fi
}

# desc: Lists all custom aliases with their descriptions.
function list_aliases() {
  local aliases_file="$HOME/.zsh_config/aliases.zsh"

  if [[ ! -f "$aliases_file" ]]; then
    echo "Error: Aliases file not found at $aliases_file"
    return 1
  fi

  # Define ANSI color codes using $'...' to force escape sequence interpretation.
  local green=$'\e[0;32m'
  local reset=$'\e[0m'

  # Pass the variables to awk using the -v flag.
  awk -v green="$green" -v reset="$reset" '
    /^# desc:/ {
      gsub(/^# desc: /, ""); 
      description = $0; 
      next;
    }
    /^alias / {
      split($0, parts, "=");
      gsub(/alias /, "", parts[1]);
      printf "%s%s%s\t%s\n", green, parts[1], reset, description;
    }
  ' "$aliases_file" | column -t -s $'\t'
}

# desc: List custom functions with their descriptions in a formatted table.
function list_functions() {
  local functions_file="$HOME/.zsh_config/functions.zsh"
  
  if [[ ! -f "$functions_file" ]]; then
    echo "Error: Functions file not found at $functions_file"
    return 1
  fi
  
  # Define ANSI color codes
  local green=$'\e[0;32m'
  local reset=$'\e[0m'
  
  # Use awk to parse the functions file
  awk -v green="$green" -v reset="$reset" '
    /^# desc:/ {
      gsub(/^# desc: /, ""); 
      description = $0; 
      next;
    }
    /^function / {
      # Grab the second field (the function name)
      name = $2;
      # Remove the trailing () from the name
      gsub(/\(\)/, "", name);
      printf "%s%s%s\t%s\n", green, name, reset, description;
    }
  ' "$functions_file" | column -t -s $'\t'
}

# desc: Display a cheat sheet of all custom aliases and functions.
function cheatsheet() {
  # Define ANSI color codes for the headers
  local bold_cyan=$'\e[1;36m'
  local reset=$'\e[0m'
  
  # Print the header for aliases, then call the function
  echo "\n${bold_cyan}--- Your Custom aliases ---${reset}"
  list_aliases
  
  # Print the header for functions, then call the function
  echo "\n${bold_cyan}--- Your Custom Functions ---${reset}"
  list_functions
  
  echo # Add a final blank line for spacing
}
