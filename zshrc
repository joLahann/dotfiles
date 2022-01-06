# ZSH {{{1
export ZSH=$HOME/.oh-my-zsh/
ZSH_THEME="maran"
alias ohmyzsh="vim ~/.oh-my-zsh"
plugins=(git history)
source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Private folder
alias privateMount='cryfs ${HOME}/Dropbox/.encryptedPrivate ${HOME}/.private'
alias privateUMount='fusermount -u ~/.private'

# FZF {{{1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER='***'
export FZF_DEFAULT_COMMAND='ag -g "" '
#
#Tmuxinator {{{1
alias mux=tmuxinator

# Anaconda {{{1
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(${HOME}'/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/anaconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Rbenv
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# XmodMap {{{1
case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    ~/.dotfiles/linux/xmodmap.sh
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# vim {{{1
export EDITOR=nvim

# Settings {{{1
stty -ixon # Disable float control
alias v=nvim
alias vim=nvim

# Other Aliases {{{1
alias rm=trash
alias rmsvndir='find . -name .svn -exec rm -rf {} \;'
alias tmux='tmux -2'
alias cdr= cd $projectRootDir
alias tree='tree --dirsfirst -I "__*"'

# Custon functions {{{1
svnrm() {
    svn rm `svn status |grep "^\!"|awk '{print $2})'`
}
svnadd() {
    svn add `svn status |grep "^?"|awk '{print $2}'`
}



