# Path to your oh-my-zsh configuration.
export ZSH=/home/johannes/.oh-my-zsh/

# Private folder
alias privateMount='cryfs /home/johannes/Dropbox/.encryptedPrivate /home/johannes/.private'
alias privateUMount='fusermount -u ~/.private'
alias rmm='java -jar ~/scripts/rmm.jar '

alias iwiMount='cryfs /home/johannes/Dropbox/.IWiPromotion /home/johannes/IWiPromotion'
alias iwiUMount='fusermount -u ~/IWiPromotion'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias mux=tmuxinator

#anaconda python environment
export PATH=/home/johannes/anaconda3/bin:$PATH

#Android SDK
export ANDROID_HOME=/home/johannes/applications/android
export PATH=${PATH}:~/applications/android/platform-tools:/applications/android/tools

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="maran"
export CVPWL_ROOT="${HOME}/.cvpwl"
if [ -d "${CVPWL_ROOT}" ]; then
    export PATH="${CVPWL_ROOT}/bin:${PATH}"
fi
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M"
export SCALA_HOME=~/bin/scala-2.10.4
export PATH=$SCALA_HOME/bin:$PATH
export EDITOR=vim
# Activator
export PATH=~/applications/activator-dist-1.3.10/bin:$PATH
# Forge
export FORGE_HOME=~/applications/forge
export PATH=$PATH:$FORGE_HOME/bin
export FZF_COMPLETION_TRIGGER='***'
export FZF_DEFAULT_COMMAND='ag -g "" '
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
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
#FZF
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
___private_vi(){
  if [ "$TMUX" != "" ]; 
  then
    local x
    x=0
    x=`tmux list-windows| awk 'match($2,/vim*/) {print 1}'`
    if [ "$x" = 1 ];
    then
      tmux select-window -t vim
    else 
      tmux new-window -n vim
    fi 
    x=`tmux display-message -p '#S'`
    local y
    y=0
    y=`vim --serverlist|grep -i $x`
    if [[ ! "$y" =~ [^[:space:]] ]]; 
    then
    vim -c "call ServerVimSettings()" --servername $x $@

    else
    vim -c "call ServerVimSettings()" --servername $x --remote-silent $@
    fi


  fi
}

___private_v() {
    local file
      file=$(fzf-tmux --query="$1" --select-1 --exit-0)
        [ -n "$file" ] && ___private_vi "$file"
      }
fd() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history)
source $ZSH/oh-my-zsh.sh
# Customize to your needs...
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
alias pbcopy='xclip -selection clipboard'
alias rm=trash
alias pbpaste='xclip -selection clipboard -o'
alias ssh_linda='ssh linda.iwi.uni-sb.de -p 22022'
alias rmsvndir='find . -name .svn -exec rm -rf {} \;'
alias g='gvim --servername "default" --remote-silent '
alias tmux='tmux -2'
alias v=nvim
alias vim=nvim
alias cdr= cd $projectRootDir

alias tree='tree --dirsfirst -I "__*"'
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/application:$PATH"
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
svnrm() {
    svn rm `svn status |grep "^\!"|awk '{print $2})'`
}
svnadd() {
    svn add `svn status |grep "^?"|awk '{print $2}'`
}
sereneDocker(){
  make -f ~/data/versioning/SERENE/trunk/docker/Makefile "$*";
}
#alias svndiff = vim `(svn status .|grep "^C"|awk '{print $2}')`
# Disable float control
stty -ixon
# Load LSCOLORS
# eval "$(dircolors -b ~/.dircolors)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/johannes/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/johannes/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/johannes/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/johannes/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
~/.dotfiles/linux/xmodmap.sh


# After each command, save and reload history
