# Dotfiles

This repository contains my personal collection of dotfiles, organized and managed using GNU Stow, a free software that simplifies the management of software configurations via symbolic links. It's designed to make it easy to maintain a clean and organized home directory while keeping configurations version-controlled.

## Getting Started

### Prerequisites

Ensure you have GNU Stow installed on your system. Stow is available in the package repositories of most Linux distributions and can be installed using the package manager. For example, on Ubuntu:

```bash
sudo apt-get install stow
```

For macOS, you can use Homebrew:

```bash
brew install stow
```

### Installation

1. Clone this repository into your home directory or a directory of your choice. If you clone it into a directory other than your home directory, adjust the stow commands accordingly.

```bash
cd ~
git clone https://github.com/anundsson/dotfiles.git
```

2. Navigate to the cloned `dotfiles` directory:

```bash
cd dotfiles
```

3. Use GNU Stow to symlink the desired configurations into your home directory. For example, to apply all configurations:

```bash
stow .
```

Repeat the above step for each configuration package you wish to apply.

### Available Configurations

Here is a list of available configurations in this repository:

- `zsh` - Z shell configuration
- *(list other configurations as they are added to the repository)*

## Customization

Feel free to fork this repository and customize the dotfiles to suit your preferences. If you're new to dotfiles or GNU Stow, many resources are available online to help you get started with personalizing your environment.

## Contributing

While this is a personal collection of dotfiles, contributions or suggestions are welcome. If you have improvements or suggestions, please open an issue or pull request.