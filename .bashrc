export WORKON_HOME=~/.virtualenvs
# set source venvwrapper
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/mysql/bin:/Users/daniel/.virtualenvs/codehs/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/Android Studio.app/sdk/platform-tools:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH=/System/Library/Frameworks/JavaScriptCOre.framework/Versions/Current/Resources/:$PATH

# CodeHS aliases
alias setup="workon codehs; cd ~/Documents/codehs/codehs;"
alias server="workon codehs; cd ~/Documents/codehs/codehs; ./manage.py runserver;"
alias shell="workon codehs; cd ~/Documents/codehs/codehs; ./manage.py shell_plus;"
alias frozen-server="workon codehs; cd ~/Documents/codehs/codehs; USE_FROZEN=True ./manage.py runserver;"
alias frozen-shell="workon codehs; cd ~/Documents/codehs/codehs; USE_FROZEN=True ./manage.py shell_plus;"
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
alias s="subl" # open the current dir in sublime with `s`

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


function parse_git_dirty {
 [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/{\1$(parse_git_dirty)}/"
}

# function parse_git_branch {
#    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \{\1\}/'
# }

# Set the prompt
BLUE="\[\033[0;34m\]"
DEFAULT="\[\033[0m\]"
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="[\$CurDir]$BLUE\$(parse_git_branch) $DEFAULT\$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
