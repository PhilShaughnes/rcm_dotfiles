#lean and minimalistic Bash prompt
# Author: Artem Sapegin, sapegin.me
# 
# Inspired by: https://github.com/sindresorhus/pure & https://github.com/dreadatour/dotfiles/blob/master/.bash_profile
#
# Notes:
# - $local_username - username you don’t want to see in the prompt - can be defined in ~/.bashlocal : `local_username="admin"`
# - Colors ($RED, $GREEN) - defined in ../tilde/bash_profile.bash
#

local_username="phil"
#Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
DGRAY="$(tput setaf 245)"
DIM="$(tput dim)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

# User color
case $(id -u) in
  0) user_color="$RED" ;;  # root
  *) user_color="$GREEN" ;;
esac

# Symbols
prompt_symbol="❯"
prompt_clean_symbol="☀ "
prompt_dirty_symbol="☂ "
prompt_venv_symbol="☁ "



format_time() {
  local _time=$1

  # Don't show anything if time is less than 5 seconds
  (( $_time < 5 )) && return

  local _out
  local days=$(( $_time / 60 / 60 / 24 ))
  local hours=$(( $_time / 60 / 60 % 24 ))
  local minutes=$(( $_time / 60 % 60 ))
  local seconds=$(( $_time % 60 ))
  (( $days > 0 )) && _out=" ${days}d"
  (( $hours > 0 )) && _out="$_out ${hours}h"
  (( $minutes > 0 )) && _out="$_out ${minutes}m"
  _out="$_out ${seconds}s"
  printf "$_out"
}

debug() {
    # do nothing if completing
    [ -n "$COMP_LINE" ] && return

    # don't cause a preexec for $PROMPT_COMMAND
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return

    start_time=$(date +'%s')
}

function prompt_command() {
  # Local or SSH session?
  local remote=
  [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && remote=1

  # Git branch name and work tree status (only when we are inside Git working tree)
  local git_prompt=
  if [[ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    # Branch name
    local branch="$(git symbolic-ref HEAD 2>/dev/null)"
    branch="${branch##refs/heads/}"

    # Working tree status (red when dirty)
    local dirty=
    # Modified files
    git diff --no-ext-diff --quiet --exit-code --ignore-submodules 2>/dev/null || dirty=1
    # Untracked files
    [ -z "$dirty" ] && test -n "$(git status --porcelain)" && dirty=1

    # Format branch if wip
    if [[ "$(git log -1 --pretty=%B)" = "wip" ]]; then
      branch=$NOCOLOR$DIM$RED$branch
    fi

    # Format Git info
    if [ -n "$dirty" ]; then
      git_prompt=" $DIM$GRAY$prompt_dirty_symbol$branch*$nocolor"
    else
      git_prompt=" $DIM$GRAY$prompt_clean_symbol$branch$NOCOLOR"
    fi
  fi

  # Virtualenv
  local venv_prompt=
  if [ -n "$VIRTUAL_ENV" ]; then
      venv_prompt=" $BLUE$prompt_venv_symbol$(basename $VIRTUAL_ENV)$NOCOLOR"
  fi

  # Only show username if not default
  local user_prompt=
  [ "$USER" != "$local_username" ] && user_prompt="$user_color$USER$NOCOLOR"

  # Show hostname inside SSH session
  local host_prompt=
  [ -n "$remote" ] && host_prompt="@$DGRAY$HOSTNAME$NOCOLOR"

  # Show delimiter if user or host visible
  local login_delimiter=
  [ -n "$user_prompt" ] || [ -n "$host_prompt" ] && login_delimiter=":"

  # show time command ran
  local end_time=$(date +'%s')
  local time_f=$YELLOW$(format_time $(( end_time - start_time )))

  # Format prompt
  first_line="$user_prompt$host_prompt$login_delimiter$BLUE\w$NOCOLOR$git_prompt$venv_prompt$time_f"
  # Text (commands) inside \[...\] does not impact line length calculation which fixes stange bug when looking through the history
  # $? is a status of last command, should be processed every time prompt prints
  second_line="\`if [ \$? = 0 ]; then echo \[\$GREEN\]; else echo \[\$RED\]; fi\`\$prompt_symbol\[\$NOCOLOR\] "
  PS1="\n$first_line\n$second_line"

  # Multiline command
  PS2="\[$CYAN\]$prompt_symbol\[$NOCOLOR\] "

  # Terminal title
  local title="$(basename "$PWD")"
  [ -n "$remote" ] && title="$title \xE2\x80\x94 $HOSTNAME"
  echo -ne "\033]0;$title"; echo -ne "\007"
}

trap 'debug' DEBUG
# Show awesome prompt only if Git is istalled
command -v git >/dev/null 2>&1 && PROMPT_COMMAND=prompt_command
