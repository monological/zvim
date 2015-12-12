#!/usr/bin/env bash
#
#
#
#           ________  ___      ___ ___  _____ ______      
#          |\_____  \|\  \    /  /|\  \|\   _ \  _   \    
#           \|___/  /\ \  \  /  / | \  \ \  \\\__\ \  \   
#               /  / /\ \  \/  / / \ \  \ \  \\|__| \  \  
#              /  /_/__\ \    / /   \ \  \ \  \    \ \  \ 
#             |\________\ \__/ /     \ \__\ \__\    \ \__\
#              \|_______|\|__|/       \|__|\|__|     \|__|
#
#
#   
#   Copyright 2015 Monological
#   Licensed under MIT License
#
#
app_name="zvim"
app_dir="$HOME/.zvim"
app_uri="https://github.com/monological/zvim"
vundle_uri="https://github.com/vundlevim/vundle.vim"

p() {
    printf '%b\n' "$1" >&2
}

bad(){
    p "\e[31m[✘]\e[0m ${1}${2}"
}

good() {
    if [ "$ret" -eq '0' ]; then
    p "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

# Pre-install checks
if [ -z "$HOME" ]; then
    bad "Your HOME var is empty. Why?"  
fi

hash vim 2>/dev/null
if [ $? -eq 1 ]; then
    bad "No vim found. You need it."
fi

hash git 2>/dev/null
if [ $? -eq 1 ]; then
    bad "No git found. You need it."
fi

# Clone zvim and vundle
if [ ! -e "$app_dir/.git" ]; then
    git clone "$app_uri" "$app_dir"; ret="$?"
    good "Zvim cloned."
    git clone "$vundle_uri" "$app_dir/plugins/vundle"; ret="$?"
    good "Vundle cloned."
else
    pushd . >/dev/null
    printf "Updating zvim..."
    cd "$app_dir" && git pull origin master; ret="$?"
    printf "Done.\n"
    printf "Updating vundle..."
    cd "$app_dir/plugins/vundle" && git pull origin master; ret="$?"
    printf "Done.\n"
    popd >/dev/null
fi

# Setup dirs
if [ ! -d "$app_dir/plugins" ]; then
    mkdir -p "$app_dir/plugins"
fi

if [ ! -d "$app_dir/backup" ]; then
    mkdir -p "$app_dir/backup"
fi

# Backup old files
backup="$app_dir/backup"
now=`date=+%s`
ret=0
for f in ".vim" ".vimrc" ".gvimrc"; do
    [ -e "$f" ] && [ ! -L "$f" ] && mv "$f" "$backup/$f.$now"
    ret=$ret || $?
done
ret="$ret"
good "Backup complete. Put them in ${backup}."

# Link zvim rc files
ret=0
ln -sf "$app_dir/vimrc" "$HOME/.vimrc"; ret=$ret || $?
ln -sf "$app_dir/vimrc.plugins" "$HOME/.vimrc.plugins"; ret=$ret || $?
ln -sf "$app_dir/vimrc.before" "$HOME/.vimrc.before"; ret=$ret || $?
ret="$ret"
good "Zvim rc files linked."

# Install plugins
sys_shell="$SHELL"
export SHELL='/bin/sh'
vim -u "$app_dir/vimrc.plugins" \
    "+set nomore" \
    "+PluginInstall!" \
    "+PluginClean" \
    "+qall"
ret="$ret"
export SHELL="$sys_shell"
good "Plugins installed."

# Finished
good "\nZvim installation complete. Live long and prosper 🖖 "





