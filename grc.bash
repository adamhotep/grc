# vim:syn=sh:
GRC="$(command -v grc)"
if [[ "$TERM" != dumb ]] && [[ -x "$GRC" ]]; then

  colourify() {
    if [[ -t 1 ]]; then
      "$GRC" -es --colour=auto "$@"
    elif [[ "$CLICOLOR_FORCE$*" != "${*#*--color=always}" ]]; then
      "$GRC" -es --colour=on "$@"
    else
      "$@"
    fi
  }

  # assign the grc colours to the given command if it exists
  # Usage: _grc_assign COMMAND [ASSIGNMENT]
  _grc_assign() {
    local cmd="$1"
    if [[ "$#" -gt 1 ]]; then
      shift
    fi
    if command -v "$cmd" >/dev/null 2>&1; then
      alias "$cmd"="colourify $*"
    fi
  }

  # Here is the list of commands mapped to themselves without options
  for cmd in ant as blkid cc cvs c++ df diff dig dnf \
             docker docker-compose docker-machine \
             du free gas gcc getfacl getsebool g++ gmake \
             hd head hexdump ifconfig ioping iostat ip iptables \
             journalctl last ld ldap lsattr lsblk lsmod lspci \
             make mount mtr mvn netstat nmap oping ping ping6 \
             ps sar semanage setsebool showmount ss stat \
             sysctl systemctl tail tcpdump traceroute traceroute6 \
             tune2fs ulimit uptime vmstat w who wdiff
  do
    _grc_assign "$cmd"
  done

  # Individual commands that need extra help or options
  _grc_assign getsebool setsebool

  # ls is tricky since  ls -C |cat  differs from plain  ls  so we just have `ll`
  # and let manual invocations of  ls -l  go without the extra GRC coloring.
  # Consider  alias ll='ll -ph'  but watch out for overriding  alias  ll='ls -l'
  if ls -ld --color=always / >/dev/null 2>&1; then GNU_LS="--color=always"; fi
  function ll() {
    if [[ -t 1 ]] || [[ -n "$CLICOLOR_FORCE" ]]
      then colourify ls -l $GNU_LS "$@"
      else ls -l "$@"
    fi
  }
  ALIAS_LS="$(alias ls 2>/dev/null || echo "alias ls='ls -h'")"
  ALIAS_LS_CMD="${ALIAS_LS#*\'ls}"
  if [ "$ALIAS_LS" != "$ALIAS_LS_CMD" ]; then
    ALIAS_LS_CMD="${ALIAS_LS_CMD%%\'*}"
    alias ll="ll $ALIAS_LS_CMD"
  fi

  # This needs run-time detection. We even fake the 'command not found' error.
  configure() {
    if [[ -x ./configure ]]; then
      colourify ./configure "$@"
    else
      echo "configure: command not found" >&2
      return 127
    fi
  }

  # env output is supported, but not its ability to run other programs
  env() {
    if [[ -t 1 || -n "$CLICOLOR_FORCE" ]] && [[ "${*:--0}" = "-0" ]]
      then colourify env "$@"
      else command env "$@"
    fi
  }

  # only colorize when a listing is requested
  crontab() {
    if [[ $* != *-l ]]; then command crontab "$@"; return $?; fi
    local cron retval expand ts
    cron=$(command crontab "$@")
    retval=$?
    if ! command -v expand >/dev/null 2>&1; then
      expand() { cat; }
    else
      # take the tabspace variable from the first vim cue in a comment
      ts=$(echo "$cron" |grep -Pom1 '#.*\b(?:ts|tabspace)=\K[0-9]+\b' || echo 8)
    fi
    echo "$cron" |expand -t $ts |grcat conf.crontab
    return $retval
  }

  # Clean up variables
  unset cmd
fi
