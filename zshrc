#===============================================================================
# File Name:   .zshrc
# Author:      Cody Cziesler
# Description: My dot-file for zsh. Since I use oh-my-zsh, it will setup that.
#              This script will also load my ~/.aliases dotfile, and setup my
#              path environmental variable.
#===============================================================================

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Plugins to load
plugins=(git osx brew themes colored-man)

source $ZSH/oh-my-zsh.sh

# User configuration
path+="/usr/local/bin"
path+="/Users/cody/scripts/perl"
path+="/Users/cody/scripts/bash"
path+="/usr/local/mysql/bin"
path+="/opt/local/bin"
path+="/opt/local/sbin"
path+="/usr/bin"
path+="/bin"
path+="/usr/sbin"
path+="/sbin"
path+="/usr/local/bin"
path+="/usr/local/texlive/2013basic/bin/x86_64-darwin"

# Print colors
aa_256 () {
  ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;
  for i in {0..256};
  do
    o=00$i;
    echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;
  done )
}

# Aliases
source ~/.aliases

echo "Sourced ~/.zshrc"
