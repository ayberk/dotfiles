# Path to your oh-my-zsh installation.
export ZSH=/Users/ayilmaz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode history-substring-search nyan git github virtualenv pip python brew osx)

# fix history search (vi mode breaks this)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down]]]]

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
setopt correct

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fortune -s | cowsay | lolcat

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%D{%m/%d} %T % %{$reset_color%}'

export JAVA_HOME=$(/usr/libexec/java_home)

# no love without venv
export PIP_REQUIRE_VIRTUALENV=true
# but sometimes love doesn't matter
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

alias dockerconfig="eval $(docker-machine env default)"
alias dockerkillall="docker ps | awk '{ print $1 }' | xargs docker kill"
alias kubeprod="kubectl --context=nisp-prod"
alias kubewest="kubectl --context=nisp-prod-west"
alias kubelab="kubectl --context=nisp-lab"
alias kubeoemv2west="kubectl --context=oemv2-usw2"
alias kubeoemv2east="kubectl --context=oemv2-use1"
alias kubehub="kubectl --context=hub"
alias kubehubv2="kubectl --context=hubv2"

export GOPATH=/Users/ayilmaz/workspace/goworkspace
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export EDITOR=vim

eval "$(direnv hook zsh)"
export PATH="/usr/local/sbin:$PATH"
export PATH=$(brew --prefix)/opt/python/libexec/bin":$PATH"
