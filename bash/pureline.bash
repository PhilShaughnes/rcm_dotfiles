# human Readable time output
# e.g., 5d 6h 3m 2s
format_time() {
  local _time=$1

  # Don't show anything if time is less than 5 seconds
  (( $_time < 5 )) && return

  local _out
  local days=$(( $_time / 60 / 60 / 24 ))
  local hours=$(( $_time / 60 / 60 % 24 ))
  local minutes=$(( $_time / 60 % 60 ))
  local seconds=$(( $_time % 60 ))
  (( $days > 0 )) && _out="${days}d"
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

prompt() {
    end_time=$(date +'%s')
    time_f=$(format_time $(( end_time - start_time )))

    PS1="${time_f} (•◡•)❥"
}

trap 'debug' DEBUG
PROMPT_COMMAND=prompt
