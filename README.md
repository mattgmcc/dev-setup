# dev-setup
## Custom Zsh & Productivity Setup
**Overview**
This configuration modularizes the `~/.zshrc` file to keep it clean and maintainable. It uses **Oh My Zsh** with the **Powerlevel10k** theme and creates a dedicated `~/.zsh_config/` directory for personal customizations.

## 📂 File Structure

Your main `.zshrc` is now just a loader. All logic lives in the config directory:

~/.
├── .zshrc                  # Main entry point (loads OMZ, Theme, and .zsh_config/*)
└── .zsh_config/            # Directory for all custom settings
    ├── aliases.zsh         # Simple command shortcuts (includes # desc: tags)
    ├── functions.zsh       # Complex logic & fzf tools (includes # desc: tags)
    ├── theme.zsh           # Powerlevel10k prompt configuration
    ├── tools.zsh           # Init scripts for tools (NVM, jEnv, pyenv)
    ├── env.zsh             # Environment variables (PATH, Homebrew, AWS)
    └── plugins.zsh         # Zsh plugins (syntax-highlighting, autosuggestions)

## 🚀 Prerequisites & Tools

Ensure these are installed via Homebrew (`brew install ...`) for all functions to work:

* **Core:** `oh-my-zsh`, `powerlevel10k`
* **Search Engine:** `fzf` (Fuzzy Finder), `fd` (Fast search backend), `bat` (Cat clone with syntax highlighting), `tree` (Directory visualizer).
* **Version Managers:** `jenv` (Java), `pyenv` (Python), `nvm` (Node.js).

## ☕ Java Version Management (jEnv)

We removed `sdkman` and moved to `jenv` for cleaner project-based switching.

* **Add a new JDK:** `jenv add /path/to/java/home`
* **Set Global Version:** `jenv global <version>`
* **Set Project Version:** `cd ~/my-project` then `jenv local <version>`
* **List Versions:** `jenv versions`

## ⚡ Custom "Superpower" Commands

These functions use `fzf` to make terminal tasks interactive.
Run the command `cheatsheet` to see this list dynamically in your terminal.

| Command | Category | Description |
| :--- | :--- | :--- |
| **`cheatsheet`** | *Meta* | **The Master Command.** Searchable list of all aliases & functions below. |
| **`search`** | *Fuzzy* | Search recursive files/dirs in current folder. **Enter** opens in VS Code. |
| **`search_repos`** | *Fuzzy* | Search files inside `~/IdeaProjects`. **Enter** opens in VS Code. |
| **`open_repo`** | *Fuzzy* | Search top-level directories in `~/IdeaProjects`. **Enter** opens in VS Code. |
| **`gfb`** | *Git* | Fuzzy-find and checkout a Git branch. |
| **`sshKeyReset`** | *System* | Resets SSH agent and re-adds your specific `bvengineering` key. |
| **`flocate`** | *System* | Instant system-wide search using the macOS `locate` index. |

## 📝 How to Add New Shortcuts

1.  **For simple aliases:** Edit `~/.zsh_config/aliases.zsh`.
    * Format: `alias name="command"`
    * *Documentation:* Add `# desc: Description here` on the line before.

2.  **For complex logic:** Edit `~/.zsh_config/functions.zsh`.
    * Format: `function name() { ... }`
    * *Documentation:* Add `# desc: Description here` on the line before.

3.  **Apply changes:** Run `source ~/.zshrc` or open a new terminal tab.

## ⚡ Performance Note
We set `FZF_DEFAULT_COMMAND` to use `fd`. This ensures searches ignore `.git`, `node_modules`, and hidden files, making your `search` commands blazing fast.
