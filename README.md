Here’s the `README.md` file with improved formatting for better readability:

---

# Dotfiles

This repository contains my personal collection of dotfiles, organized and managed using GNU Stow. Stow simplifies the management of software configurations via symbolic links, helping maintain a clean and organized home directory while keeping configurations version-controlled.

## Getting Started

### Prerequisites

Ensure you have GNU Stow installed on your system. Stow is available in the package repositories of most Linux distributions and can be installed using your package manager.

For example, on **Ubuntu**:

```bash
sudo apt-get install stow
```

For **macOS**, you can use Homebrew:

```bash
brew install stow
```

### Installation

1. **Clone this repository** into your home directory or a directory of your choice. If you clone it into a directory other than your home directory, adjust the stow commands accordingly.

    ```bash
    cd ~
    git clone https://github.com/anundsson/dotfiles.git
    ```

2. **Navigate to the cloned `dotfiles` directory:**

    ```bash
    cd dotfiles
    ```

3. **Run the SSH Key Creation Script**

    If you need to create multiple SSH keys, you can use the provided script, `create-ssh-keys.sh`, to set up keys without overwriting existing ones. This is useful for managing separate SSH keys for different GitHub or Bitbucket accounts.

    To use the script:

    - **Make the script executable:**

        ```bash
        chmod +x create-ssh-keys.sh
        ```

    - **Run the script to generate and add SSH keys:**

        ```bash
        sh ./create-ssh-keys.sh
        ```

    This script checks for existing SSH keys before creating new ones, generating keys only if they are not already present.

4. **Applying Configurations with Stow**

    After setting up your SSH keys, use GNU Stow to symlink the desired configurations into your home directory. For example, to apply all configurations:

    ```bash
    stow .
    ```

    Repeat this command for each configuration package you wish to apply.

### Available Configurations

Here is a list of available configurations in this repository:

- `zsh` - Z shell configuration
- `.claude/` - Claude Code config (agents, commands, settings) — plain stow package

## Claude Code Config (`.claude/`)

`.claude/` is a plain directory in this repo. `stow -t ~ .` symlinks `~/.claude → ~/dotfiles/.claude` so Claude Code's default path works with no extra config.

Machine-local state (sessions, history, tokens) is written into the same dir by Claude Code at runtime but excluded via `.claude/.gitignore`.

### Fresh machine setup

```bash
git clone git@github.com:anundsson/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -t ~ .
```

If `~/.claude` already exists, back it up first:

```bash
mv ~/.claude ~/.claude.bak
stow -t ~ .
# restore machine-local dirs from backup if needed (plugins/, projects/, sessions/)
```

### Machine-local settings

`statusLine` and machine-specific settings go in `~/.claude/settings.local.json` — gitignored, never committed.

## Customization

Feel free to fork this repository and customize the dotfiles to suit your preferences. If you're new to dotfiles or GNU Stow, many resources are available online to help you get started with personalizing your environment.

## Contributing

While this is a personal collection of dotfiles, contributions or suggestions are welcome. If you have improvements or suggestions, please open an issue or pull request.

---

This README layout keeps each section distinct and uses clear, bolded step headers to guide users through the setup process effectively.