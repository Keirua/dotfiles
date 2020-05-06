# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
    git
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/apps:$HOME/.phpenv/bin:$HOME/.local/bin/:$PATH"
export PATH=$PATH:/usr/local/go/bin:/home/clemk/.rbenv/bin:$HOME/.composer/vendor/bin:$HOME/go/bin
alias grep=rg
alias ls=exa
alias gti=git
alias tig=git
alias tgi=git

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completior

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GITHUB_USERNAME keirua
alias gcb='git checkout $(git branch | fzf)'

alias latotale='bundle install && yarn install --check-files && bundle exec rake db:migrate RAILS_ENV=development && bundle exec rake db:migrate RAILS_ENV=test && git checkout db/schema.rb'

export EDITOR='vim'

[[ -s /home/clemk/.autojump/etc/profile.d/autojump.sh ]] && source /home/clemk/.autojump/etc/profile.d/autojump.sh
	autoload -U compinit && compinit -u

