source ~/.zplug/init.zsh
export ZSH=/Users/Phathdt/.oh-my-zsh
export HOMEBREW_NO_AUTO_UPDATE=1
source $ZSH/oh-my-zsh.sh # source "$HOME/.cargo/env"

zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "mdumitru/git-aliases"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "droctothorpe/kubecolor"
zplug "nnao45/zsh-kubectl-completion"
zplug "greymd/docker-zsh-completion"
zplug "Aloxaf/fzf-tab"
zplug "z-shell/zsh-eza"
zplug "themes/robbyrussell", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/asdf", from:oh-my-zsh

zplug load

# alias K8s
alias k=kubectl
alias vi=nvim
alias vim=nvim
alias n=nvim

# alias Git
alias gpall="git push origin --all"
alias gmerge='git checkout staging && git pull origin staging && git merge --no-edit'

alias dev='cd ~/Documents/Dev/ && echo "Welcome Dev"'
alias down='cd ~/Downloads/ && echo "Welcome Downloads"'

#go
export GOPATH=$(asdf where golang)/packages
export GOROOT=$(asdf where golang)/go
export PATH="${PATH}:$(go env GOPATH)/bin"

. ~/.asdf/plugins/golang/set-env.zsh

export PATH="$PATH:/Users/phathdt/Downloads/istio-1.20.0/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:~/.bun/bin"

export DOCKER_BUILDKIT=0


ulimit -n 2048

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phathdt/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phathdt/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phathdt/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phathdt/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.env


# History
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
