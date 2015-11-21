#!/bin/bash

# This script creates symlinks in home directory to all files in this directory

# Dotfiles directory
dir=$(pwd)
# Old dotfiles backup directory
backupDir=~/dotfiles_old

# List of files/folders to symlink in homedir
filesToIgnore="README.md|install.sh"
files=$(ls | grep -Ev "$filesToIgnore")

# Move any existing dotfiles in homedir to backupDir directory, then create symlinks
for file in $files; do

    oldFile=~/.$file

    # If file exist moves it to backup directory
    if [ -a $oldFile ]; then

        # If needed create backup directory
        if [ ! -d $backupDir ]; then
            mkdir -p $backupDir
        fi

        echo "Moving $oldFile from ~ to $backupDir"
        mv $oldFile $backupDir
    fi

    echo "Creating symlink to $file in home directory."
    # f - needed for broken symlinks. They are not detected by if [ -a ]
    ln -sf $dir/$file ~/.$file
done

echo "Done."
