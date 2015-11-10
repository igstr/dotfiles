#!/bin/bash

# This script creates symlinks in home directory to all files in this directory

# Dotfiles directory
dir=$(pwd)
# Old dotfiles backup directory
backupDir=~/dotfiles_old

# List of files/folders to symlink in homedir
files=$(ls --ignore=install.sh)

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do

    oldfile=~/.$file

    # If file exist moves it to backup directory
    if [ -f $oldfile ]; then

        # If needed create backup directory
        if [ ! -d $backupDir ]; then
            mkdir -p $backupDir
        fi

        echo "Moving $oldFile from ~ to $backupDir"
        mv $oldfile $backupDir
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Done."
