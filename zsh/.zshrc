# Use powerline
USE_POWERLINE="false"
USE_STARSHIP="true"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [ "$USE_POWERLINE" = true ] && [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# explaination: 
#command -v <command to test if exists> > /dev/null 2>&1 (redirects stdout and stderr to /dev/null) 
# && (what follows && only executes if the preceeding returned true). So below says, if  USE_STARSHIP
# and starship command exists then run it
if [ "$USE_STARSHIP" = true ]; then
  command -v starship > /dev/null 2>&1 && eval "$(starship init zsh)"
fi

export TERM="xterm-256color"
# [https://github.com/iggredible/Learn-Vim/tree/master]
# [https://www.gnu.org/software/emacs/tour/]
# [https://joe-editor.sourceforge.io/]
export EDITOR="/usr/bin/vim"
export COLORTERM="truecolor"




# Source manjaro-zsh-configuration
# it's worth looking at these files.
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

#begin override manjaro defaults
# read these to understand
# [https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh]
# [https://stackoverflow.com/questions/19454837/bash-or-zsh-histsize-vs-histfilesize] 
#history
HISTFILE=~/.zhistory
HISTFILESIZE=1000000
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY


# set the PATH environment variable

# standard include of ~/bin where a user's shell scripts are typically stored.
if [[ -d $HOME/bin ]]; then
  export PATH=$PATH:$HOME/bin
fi

# enabling snapd
if [[ -d /var/lib/snapd/snap/bin ]]; then
  export PATH=$PATH:/var/lib/snapd/snap/bin
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



