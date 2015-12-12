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

if [ -e "$HOME/.zvim" ]; then
    rm $HOME/.vimrc
    rm $HOME/.vimrc.plugins
    rm $HOME/.vimrc.before
    
    # TODO: restore backup rc files
    # TODO: delete .zvim directory
fi

