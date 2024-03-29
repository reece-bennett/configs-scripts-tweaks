# These allow git_ps1 to show repo file status, disabled because they have bad
# performance when the prompt is run
# GIT_PS1_SHOWDIRTYSTATE='true'
# GIT_PS1_SHOWUNTRACKEDFILES='true'
# GIT_PS1_SHOWUPSTREAM='verbose'

PS1='\[\033]0;Git Bash\007\]'  # set window title
PS1="$PS1"'\[\033[33m\]'       # change to yellow
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
  GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
  COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
  COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
  COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
  if test -f "$COMPLETION_PATH/git-prompt.sh"
  then
    . "$COMPLETION_PATH/git-completion.bash"
    . "$COMPLETION_PATH/git-prompt.sh"
    PS1="$PS1"'\[\033[36m\]'  # change color to cyan
    PS1="$PS1"'`__git_ps1`'   # bash function
  fi
fi
PS1="$PS1"'\[\033[0m\]'       # reset color
PS1="$PS1"' $ '               # prompt: always $
