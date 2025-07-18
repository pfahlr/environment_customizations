USE_POWERLINE=false
USE_STARSHIP=true
USE_MANJARO_STOCK_ZSH_CONFIG=false

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ $USE_POWERLINE && -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# command -v <command to test if exists> > /dev/null 2>&1 (redirects stdout and stderr to /dev/null)
# && (what follows && only executes if the preceeding returned true). So below says, if  USE_STARSHIP
# and starship command exists then run it
[[ $USE_STARSHIP ]] && command -v starship > /dev/null 2>&1 && eval "$(starship init zsh)"

export TERM="xterm-256color"
# [https://github.com/iggredible/Learn-Vim/tree/master]
# [https://www.gnu.org/software/emacs/tour/]
# [https://joe-editor.sourceforge.io/]
export EDITOR="/usr/bin/vim"
export COLORTERM="truecolor"

# Source manjaro-zsh-configuration
# it's worth looking at these files.
[[ $USE_MANJARO_STOCK_ZSH_CONFIG && -e /usr/share/zsh/manjaro-zsh-config ]] && source /usr/share/zsh/manjaro-zsh-config

# Use manjaro zsh prompt
[[ $USE_MANJARO_STOCK_ZSH_CONFIG && -e /usr/share/zsh/manjaro-zsh-prompt ]] && source /usr/share/zsh/manjaro-zsh-prompt

[[ ! $USE_MANJARO_STOCK_ZSH_CONFIG && -f ~/.zsh-completions-rc ]] && source .zsh-completions-rc

# history file options
# ---------------------------
# read more:
# [https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh]
# [https://stackoverflow.com/questions/19454837/bash-or-zsh-histsize-vs-histfilesize]
HISTFILE=~/.zhistory
HISTFILESIZE=1000000
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# use a separate file for defining additions to $PATH env variable
[[ -f $HOME/.zsh-paths ]] && source $HOME/.zsh-paths
setopt beep extendedglob notify
bindkey -v

# aliases go in .zsh-aliases
[[ -f $HOME/.zsh-aliases ]] && source $HOME/.zsh-aliases



