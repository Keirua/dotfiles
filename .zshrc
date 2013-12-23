# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="candy"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games


autoload -U compinit
compinit
 
#Insensible à la casse
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
 
#compinstall
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"


autoload colors; colors
export PS1="%B[%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b%{$reset_color%}:%~%B]%b "
 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'

# Alias df -h
alias df='df -h'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
 
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim
 
#Activer l'historique des commandes:
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST


####################################
# SSH
####################################

alias vm="gnome-terminal --window-with-profile=clem_dev --execute bash -c 'ssh evaneos@192.168.152.129'"

alias ev_preprod="gnome-terminal --window-with-profile=profile_preprod --execute bash -c 'ssh evaneos@preprod.evaneos.com'"
alias ev_prod="gnome-terminal --window-with-profile=profile_prod --execute bash -c 'ssh evaneos@www.evaneos.com'"
alias ev_dev="gnome-terminal --window-with-profile=clem_dev --execute bash -c 'ssh clement@clement.dev.evaneos.com'"
alias ev_scrum1="gnome-terminal --window-with-profile=profile_preprod --execute bash -c 'ssh scrum1@scrum1.dev.evaneos.com'"

# Command that adds the RSA key of the current machine to an external machine (here, my VM), so that I do not have to type the password everytime I want to log in
# You only have to type this once, but I've a terrible memory for stuff like this
# cat ~/.ssh/id_rsa.pub | ssh evaneos@192.168.152.129 'cat - >> ~/.ssh/authorized_keys'



####################################
# PostGres
####################################

alias db_local='ssh -f -N -T -L 6666:127.0.0.1:5432 evaneos@www.evaneos.com.dev'

alias db_preprod="ssh -f -N -T -L 6668:127.0.0.1:5432 evaneos@preprod.evaneos.com"

alias db_prod="ssh -f -N -T -L 6667:127.0.0.1:2345 evaneos@cluster.evaneos.typhon.net"

alias db_scrum1="ssh -f -N -T -L 6669:127.0.0.1:5432 evaneos@preprod.evaneos.com"

#alias db_scrum1="kill -9 `ps x | grep "evaneos@preprod.evaneos.com" | cut -c1-6` && ssh -f -N -T -L 6668:127.0.0.1:5432 evaneos@preprod.evaneos.com"


####################################
# Random useful stuff
####################################

# Find a file for lazy people like me
function ivelost () {
    # Initial version :
    # find . -iname "$1*"

    # Improved version by @strycore
    # https://github.com/strycore/dotfiles/blob/master/bashrc#L110
    for i in "$@"; do
        ( find -iname "*$i*" | grep -i "$i" --color=auto ) 2> /dev/null;
    done
}

# Finds the id for a given process
function psgrep () {
    ps aux | grep $1
}

# Kill all the instances of a given process, after looking for it through psgrep
function stfu {
    psgrep $1 | tr -s " " | cut -d" " -f 2 | xargs kill -9
}

functions knocks () {
    knock dev.evaneos.com 7022 8022 6022
    knock www.evaneos.com 7022 8022 6022
    knock preprod.evaneos.com 7022 8022 6022
    echo "Knocked ports !"  
}

alias gut='git'
alias reloadzshrc='source ~/.zshrc'
alias back='cd $OLDPWD'

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
plugins=(git)