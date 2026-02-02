# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# custom aliases
alias zshconfig="code ~/.zshrc"
alias reload="source ~/.zshrc"
alias upgrade='
    omz update && \
    if command -v brew >/dev/null 2>&1; then
        brew update && brew upgrade
    elif command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt upgrade -y
    fi
'

# bat
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
elif command -v batcat >/dev/null 2>&1; then
  alias cat="batcat --paging=never"
fi

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

# OpenClaw Completion (cached)
if command -v openclaw >/dev/null 2>&1; then
  _oc_cache="${XDG_CACHE_HOME:-$HOME/.cache}/openclaw-completion.zsh"
  if [[ ! -f "$_oc_cache" || "$(command -v openclaw)" -nt "$_oc_cache" ]]; then
    openclaw completion --shell zsh >| "$_oc_cache"
  fi
  source "$_oc_cache"
fi

# bun completions
[ -s "/Users/andre/.bun/_bun" ] && source "/Users/andre/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source $ZSH/oh-my-zsh.sh