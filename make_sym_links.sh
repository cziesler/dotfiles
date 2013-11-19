#!/bin/bash

dir=~/git_repos/dotfiles
olddir=~/dotfiles_old
files="vimrc gvimrc profile bashrc aliases vim zshrc zprofile"


echo -n "Creating $olddir for backup of existing dotfiles in ~ ..."
rm -rf $olddir
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  echo
  echo "Moving dotfile: ~/.$file to $olddir/.$file"
  mv -f ~/.$file $olddir
  echo "Creating symlink from $dir/$file to ~/.$file"
  ln -s $dir/$file ~/.$file
done
