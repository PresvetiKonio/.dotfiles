# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# aliases
[ -f "${XDG_CONFIG_HOME}/shell/aliases" ] && source "${XDG_CONFIG_HOME}/shell/aliases"
alias ls="ls --color"
alias l="ls -la"
alias s="sway"
alias vim="nvim"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..='cd ..'
alias ...='cd ../..'
alias fuckit="poweroff"
alias cal='cal -m'
alias imgview='swallow sxiv .'

# funcions
fcd() {
    cd "$(find -type d | fzf)"
}
vimto() {
    vim "$(find -type f | fzf)"
}
wali() {
    wal -s -i "$(find ~/.config/wallpapers -type f | fzf)"
    pkill waybar 
    waybar & disown  > /dev/null 2>&1
}


# options
unsetopt menu_complete
unsetopt flowcontrol
unsetopt BEEP

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit
compinit

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# theme/plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
#source ~/.config/zsh/zsh-auto-notify/auto-notify.plugin.zsh
#source ~/.config/zsh/you-should-use/you-should-use.plugin.zsh


zstyle ':completion:*' menu select

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# auto notify options
AUTO_NOTIFY_IGNORE+=("lf" "hugo serve" "rofi")

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
