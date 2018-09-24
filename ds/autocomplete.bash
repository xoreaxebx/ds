# vi: ts=2 sw=2 et filetype=sh

#
# https://devmanual.gentoo.org/tasks-reference/completion/index.html
#

__ds_debug () {
  return
  # echo "$1" >> /tmp/ds-debug
}

__ds () {
  local cur prev opts

  __ds_debug "----------------------"
  __ds_debug "start new complete"

  COMPREPLY=()

  opts=(-v -vv -vvv -c --simulate --version -h --help)

  local context=default
  local command

  for word in "${COMP_WORDS[@]:1}"; do
    __ds_debug "new part \"$word\""

    case $word in
      -h|--help|--version)
        return
        ;;

      -v|-vv|-vvv|--simulate|-c)
        ;;

      *)
        case $prev in
          -c)
            context=$word
            __ds_debug "context found \"$context\""
            prev=
            continue
            ;;
        esac

        if [[ "${word}" =~ ^- ]]; then
          __ds_debug "some shit \"$word\""
        else
          command=$word
          __ds_debug "command found \"$command\""
        fi

        break
        ;;

    esac

    prev=$word

  done

  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  __ds_debug "words: ${COMP_WORDS[*]}"
  __ds_debug "prev ${prev}"
  __ds_debug "cur ${cur}"

  case $prev in
    -c)
      contexts=$(ds _all_contexts 2>/dev/null)
      __ds_debug "complete for context"
      __ds_debug "context variants: ${contexts}"
      COMPREPLY=( $(compgen -W "${contexts}" -- ${cur}) )
      return
      ;;
  esac

  commands=$(ds -c ${context} _all_commands 2>/dev/null)

  complete="${opts[*]} ${commands}"
  commands=($commands)

  for variant in "${commands[@]}"; do
    __ds_debug "test varian $variant"
    if [[ "$variant" == "$command" ]]; then
      __ds_debug "command exists; do nothing"
      return
    fi
  done

  __ds_debug "variants $complete"
  __ds_debug "complete for something"
  COMPREPLY=( $(compgen -W "${complete}" -- ${cur}) )

}

complete -F __ds ds

