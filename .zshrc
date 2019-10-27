export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
DEVELOPMENT_PATH=$HOME/Development

ZSH_THEME=""
plugins=(git tig docker docker-compose golang pip)
plugins+=( history history-substring-search httpie sudo postgres )
plugins+=( osx lein node npm yarn jump mosh )
plugins+=( k z alias-tips zsh-completions almostontop zsh-autosuggestions )
plugins+=( zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

## ALIAS
alias c="clear"
alias config="subl $HOME/.zshrc"
alias refreash="source $HOME/.zshrc"
alias server="python -m SimpleHTTPServer"

alias vps="ssh -v root@159.89.224.233"
alias personal="~/Development/Personal"
alias rever="~/Development/Rever"
alias ve="echo ${VIRTUAL_ENV}"
alias py="python"

## GIT
GIT_AUTHOR_NAME="Andrés García"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jose.andres.gm29@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

## GO
export GOPATH=$HOME/code/golang
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

##Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## PURE
autoload -U promptinit; promptinit
prompt pure

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


## CUSTOM FUNCTIONS

#Activate a python environment
function pyEnv() {
	if [ $1 = "off" ]
	then
		deactivate ve
	else
		source ~/Documents/Execs/Python/$1/bin/activate
	fi
}

#Run jupyter notebook with analysis environment
function notebook() {
	pyEnv Analysis && cd $DEVELOPMENT_PATH/Notebooks && jupyter notebook
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}
