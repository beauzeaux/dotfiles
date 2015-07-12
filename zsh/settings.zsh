# Autocompletion
autoload -Uz compinit
compinit

# Command line editor bound to M-x e
autoload -U edit-command-line
bindkey '^xe' edit-command-line

setopt autocd
setopt interactivecomments

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Editor
EDITOR=emacs

bindkey -e
