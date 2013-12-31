# Used to setup the colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Setup the editor
export EDITOR=vim

# Needed for MacPorts
export PATH=/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH

export PATH=~/scripts/perl:~/scripts/bash:$PATH

# Node stuff (NVM)
if [ -e ~/nvm/nvm.sh ]
then
  . ~/nvm/nvm.sh
fi

# PS1 Prompt
export PS1='\[\033[0;34m\]\u@\h \W \$\[\033[0m\] '

# http://ku1ik.com/2012/05/04/scratch-dir.html
function new-scratch {
  cur_dur="$HOME/scratch"
  new_dir="$HOME/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "New scratch dir is ready ^_^"
}

echo "Sourced .profile"
