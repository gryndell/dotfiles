
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#

# Autosuggestions, Syntax Highlighting
OPSYS=$(uname)
case $OPSYS in
  Linux)
    PLUGDIR="/usr/share"
    ;;
  FreeBSD)
    PLUGDIR="/usr/local/share"
    ;;
  *)
    :
    ;;
esac
source ${PLUGDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${PLUGDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use vim keybindings
bindkey -v
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Load completions
autoload -U compinit && compinit

# vcs info
autoload -Uz vcs_info

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt prompt_subst

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' squeeze-slashes false # to allow /*/ expansion
zstyle 'fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# VCS syling
zstyle ':vcs_info:git*' formats " %F{blue}%b%f %m%u%c %a "
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' %F{green}✚%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}●%f'

# Aliases
alias ls='ls --color'
alias vi='nvim'
alias vim='nvim'
alias indent='indent --linux-style --indent-level8 --no-tabs'

# PATH
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
GOPATH="$HOME/go"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Man Page Viewer
MANPAGER="nvim +Man!"

precmd() {
  vcs_info # runs before prompt is displayed
}

PROMPT=$'%F{green}╭─(%F{cyan}%n@%m%F{green})-[%F{white}%~%F{magenta}\${vcs_info_msg_0_}%F{green}]\n%F{green}╰─%# %F{reset}'

