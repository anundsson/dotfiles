# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to your kubeconfig
export KUBECONFIG="$HOME/.kube/config"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# aliases

# bat
command -v bat >/dev/null 2>&1 && alias cat="bat"

# pyEnv
export PYENV_ROOT="$HOME/.pyenv" # pyenv path
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# thefuck
eval $(thefuck --alias)

# zsh
alias ld="eza -lD" # lists only directories (no files)
alias lf="eza -lf --color=always | grep -v /" # lists only files (no directories)
alias lh="eza -dl .* --group-directories-first" # lists only hidden files (no directories)
alias ls="eza -al --group-directories-first" # lists everything with directories first
alias ll="eza -alf --color=always --sort=size | grep -v /" # lists only files sorted by size
alias lt="eza -al --sort=modified" # lists everything sorted by time updated

# Kubernetes

## kubecolor
if command -v kubecolor >/dev/null 2>&1; then
    alias k="kubecolor"
else
    alias k="kubectl"
fi
command -v kubecolor >/dev/null 2>&1 && alias kubectl="kubecolor"

## Export variables for dry-run and immediate delete options
export do="--dry-run=client"                  # Correct dry-run value
export yaml="-oyaml"                         # Output format in YAML
export now="--force --grace-period=0"         # Example usage: k delete pod x $now

## Dry run aliases using the corrected exported variables
alias kad="kubectl apply $do $yaml -f"        # Dry run apply from a file
alias kcd="kubectl create $do $yaml -f"       # Dry run create from a file
alias kag="kubectl apply $do $yaml -f"        # Generate YAML output without applying
alias kdd="kubectl delete $do"                # Dry run delete

## Additional useful kubectl aliases
alias kga='kubectl get all'                   # Get all resources in the current namespace
alias kg='kubectl get'                        # Shortcut for kubectl get
alias kd='kubectl describe'                   # Shortcut for kubectl describe
alias kdel='kubectl delete'                   # Shortcut for kubectl delete
alias kex='kubectl exec -it'                  # Shortcut for kubectl exec with interactive mode
alias kl='kubectl logs'                       # Shortcut for kubectl logs
alias kgp='kubectl get pods'                  # Get all pods
alias kgd='kubectl get deployments'           # Get all deployments
alias kgsvc='kubectl get services'            # Get all services
alias kns='kubectl config set-context --current --namespace' # Set namespace for current context

source $ZSH/oh-my-zsh.sh