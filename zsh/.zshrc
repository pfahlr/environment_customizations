###################################
#  _____ _____ _____ _____ _____  #
# |__   |   __|  |  | __  |     | #
# |   __|__   |     |    -|   --| #
# |_____|_____|__|__|__|__|_____| #
# 2025 Rick Pfahl 		  #
#                                 #
###################################



setopt interactive_comments

# note to acheive actual boolean false behavior variable must be set to nothing or empty
# string, not `false` as the value `true` is meaningless it evalueates true if set to anything 
USE_POWERLINE=
USE_STARSHIP=$([[ true && ! $USE_POWERLINE ]] && echo 'true')
USE_MANJARO_STOCK_ZSH_CONFIG=

export LIBVA_DRIVER_NAME=iHD

if [ -f "/run/.containerenv" ]; then
  TOOLBOX_NAME=$(grep 'name=' /run/.containerenv | sed -e 's/^name=\"\(.*\)\"$/\1/')
  echo "You are in the Toolbox: $TOOLBOX_NAME"
else
  TOOLBOX_NAME="host"
  echo "You are not currently in a Toolbox container."
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ $USE_POWERLINE && -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# command -v <command to test if exists> > /dev/null 2>&1 (redirects stdout and stderr to /dev/null)
# && (what follows && only executes if the preceeding returned true). So below says, if  USE_STARSHIP
# and starship command exists then run it

[[ $USE_STARSHIP ]] && export STARSHIP_CONFIG="~/.config/$TOOLBOX_NAME.starship.toml" && command -v starship > /dev/null 2>&1 && eval "$(starship init zsh)"

export TERM="xterm-256color"

# [https://github.com/iggredible/Learn-Vim/tree/master]
# [https://www.gnu.org/software/emacs/tour/]
# [https://joe-editor.sourceforge.io/]
export EDITOR="/usr/bin/vim"
export COLORTERM="truecolor"

# Source manjaro-zsh-configuration
# it's worth looking at these files.
[[ $USE_MANJARO_STOCK_ZSH_CONFIG && -e /usr/share/zsh/manjaro-zsh-config ]] && source /usr/share/zsh/manjaro-zsh-config

#[[ ! $USE_MANJARO_STOCK_ZSH_CONFIG && -f ~/.zsh-completions-rc ]] && source .zsh-completions-rc

# history file options
# ---------------------------
# read more:
# [https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh]
# [https://stackoverflow.com/questions/19454837/bash-or-zsh-histsize-vs-histfilesize]
#
# `history`: prints commands run since last boot
# `history <n>`: prints commands since nth command from the beginning of history
# `!<n>`: run the nth command from the beginning of history
# `setopt SHARE_HISTORY`: enable sharing of zsh history between multiple active sessions

HISTFILE=~/.zhistory
SAVEHIST=100000000
HISTFILESIZE=$SAVEHIST
HISTSIZE=100000

setopt SHARE_HISTORY
setopt beep extendedglob notify
bindkey -v

# use a separate file for defining additions to $PATH env variable
[[ -f $HOME/.zsh-paths ]] && source $HOME/.zsh-paths

# environment variables go in .zsh-env
[[ -f $HOME/.zsh-env ]] && source $HOME/.zsh-env

# functions go in .zsh-functions
[[ -f $HOME/.zsh-functions ]] && source $HOME/.zsh-functions

# aliases go in .zsh-aliases
[[ -f $HOME/.zsh-aliases ]] && source $HOME/.zsh-aliases

# list of additional rc-files to source. (configs for individual programs)
[[ -f $HOME/.zsh-rc-extra ]] && source $HOME/.zsh-rc-extra


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/var/home/rick/binary_app_releases/google-cloud-sdk/path.zsh.inc' ]; then . '/var/home/rick/binary_app_releases/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/var/home/rick/binary_app_releases/google-cloud-sdk/completion.zsh.inc' ]; then . '/var/home/rick/binary_app_releases/google-cloud-sdk/completion.zsh.inc'; fi
