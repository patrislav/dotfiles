# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME"/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Configure antigen
source $HOME/.dotfiles/submodules/antigen/bin/antigen.zsh
antigen use oh-my-zsh

# Load the theme
antigen theme bureau

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen we're done
antigen apply

