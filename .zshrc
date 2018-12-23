#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

bindkey -v
bindkey jj vi-cmd-mode
bindkey "^R" history-incremental-search-backward

# incremental search from what has been typed.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # Up
bindkey "$terminfo[kcud1]" down-line-or-beginning-search # Down
export EDITOR='vim'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

func gcd() {
  topdir=$(hg root | gawk -F/ '{print $NF}')
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  if [[ ${topdir} = 'fbsource' ]]; then
    topdir=${topdir}'/fbcode'
  fi
  if [[ ${topdir} = 'configerator-hg' ]]; then
    topdir='configerator'
  fi
  cd "/home/ritun/${topdir}/$1"
}
