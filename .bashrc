#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##############
#  DEFAULTS  #
##############

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

#  DIRCOLORS  #
eval "$(dircolors "$HOME/.dircolors")"


############
#  CUSTOM  #
############

alias ls='ls --color=tty'

PS1='[\[\033[1;31m\]\u\[\033[0m\]@\H \w]$ '
