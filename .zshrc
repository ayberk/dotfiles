export PATH=/usr/local/bin:$HOME/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# https://github.com/sbugzu/gruvbox-zsh
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    REMOTE_SESSION=true
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
    vi-mode
    git
    github
    virtualenv
    pip
    python
    brew
    macos
    history-substring-search
    sublime
    zsh-autosuggestions
    extract
)

source $ZSH/oh-my-zsh.sh
setopt correct
# Disable wildcard matching
setopt nonomatch

setopt prompt_subst  # enable command substitution (and other expansions) in PROMPT
if [ -n "$REMOTE_SESSION" ]; then
    local hostname="%{$fg_bold[black]%}%m"
    PROMPT=' %B%F{green}[$(TZ='America/Los_Angeles' date +%H:%M)]%f%b ${hostname} ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%(5~|%-1~/…/%3~|%4~) %{$reset_color%}'
else
    PROMPT=' %B%F{green}[$(TZ='America/Los_Angeles' date +%H:%M)]%f%b $fg_bold[yellow]%~ ${ret_status}%{$fg_bold[cyan]%}%p%{$reset_color%}'
    #PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%(5~|%-1~/…/%3~|%4~) %{$reset_color%}'
fi

# fix history search (vi mode breaks this)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if command -v brew &> /dev/null  && [[ ! -f ~/.fzf.zsh ]]; then 
    $(brew --prefix)/opt/fzf/install
fi
source ~/.fzf.zsh

if [ -f ~/.google.zsh ]; then
    source ~/.google.zsh
fi

alias tmux=tmx2
alias k=kubectl
alias cat=bat
alias grep="rg -S"
alias exa="exa -al"

alias glg='git log --graph --all -n 20 --pretty=format:"%Cblue%h%Creset [%Cgreen%ar%Creset] [%Cred%an%Creset] %s%C(yellow)%d%Creset"'
alias rpi='tmx2 -CC new -A -s rpi'

export HISTCONTROL=ignoreboth
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/opt/homebrew/bin:${PATH}"
export EDITOR=vim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ayberk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ayberk/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/ayberk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ayberk/google-cloud-sdk/completion.zsh.inc'; fi


function update_dns () {
SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}'`
HOME_WIFI=`echo $SSID | grep -i helloworld`
if [[ -n $HOME_WIFI ]]; then
    echo "Updating to Adguard DNS."
    networksetup -setdnsservers Wi-Fi 10.0.0.41 2601:600:9780:5890::ce7f fd1c:8082:fa7b:487c:125a:d00d:2687:b88c 2601:600:9780:5890:44aa:2968:5d50:3eb0
else
    echo "Updating to Google and Cloudflare DNS."
    networksetup -setdnsservers Wi-Fi 1.1.1.1 8.8.8.8
fi;
}

alias flush_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder && echo DNS flushed."
