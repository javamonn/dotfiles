export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/daniel/bin:/usr/local/go/bin:$PATH"

# Set the prompt to show the current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\w\[[32m\]\[[00m\]$ '

# Personal aliases
alias rm="rm -i" # make rm and mv interactive (confirm deletion or move)
alias mv="mv -i"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -FhG" # set ls to do some custom stuff
alias la="ls -a"
alias ll="ls -l"
alias gs="git status"
alias ga="git add ."
alias gcm="git commit -m"
alias gco="git checkout"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gr="git reset"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


function parse_git_dirty {
 [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/{\1$(parse_git_dirty)}/"
}

# Set the prompt
BLUE="\[\033[0;34m\]"
DEFAULT="\[\033[0m\]"
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="[\$CurDir]$BLUE\$(parse_git_branch) $DEFAULT\$ "
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
source '/home/daniel/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/daniel/google-cloud-sdk/completion.bash.inc'

export GOPATH=$HOME/gopath
