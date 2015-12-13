

                                   
           ________  ___      ___ ___  _____ ______      
          |\_____  \|\  \    /  /|\  \|\   _ \  _   \    
           \|___/  /\ \  \  /  / | \  \ \  \\\__\ \  \   
               /  / /\ \  \/  / / \ \  \ \  \\|__| \  \  
              /  /_/__\ \    / /   \ \  \ \  \    \ \  \ 
             |\________\ \__/ /     \ \__\ \__\    \ \__\
              \|_______|\|__|/       \|__|\|__|     \|__|



# Minimalistic Vim 

* minimalistic config files and scripts
* easy to tweak to your liking
* plugin management using Vundle
* works on posix systems (unix and mac) 
* fast startup

## Installation

**requires: curl, vim and git**

* `curl https://github.com/monological/zvim/blob/master/install.sh > zvim.sh`
* `sh zvim.sh && rm zvim.sh`

## Updating

* `cd ~/.zvim`
* `sh install.sh`

## Customization

* Edit ~/.vimrc if you desire to change anything
* Add vim plugin github urls to  ~/.vimrc.plugins
* Then run `vim +PluginUpdate +PluginClean +q`


## Uninstallation

* `cd ~/.zvim`
* `sh uninstall.sh && cd ~/`




