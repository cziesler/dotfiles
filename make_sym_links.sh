#!/bin/bash

dir=~/git_repos/dotfiles
olddir=~/dotfiles_old
files="vimrc"

echo -n "Creating $olddir for backup of existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir
  echo "Creating symlink to $file in ~."
  ln -s $dir/$file ~/.$file
done
