if [[ "$TERM" != dumb ]] && (( $+commands[grc] )) ; then
  # Prevent grc aliases from overriding zsh completions.
  setopt COMPLETE_ALIASES

  colourify() {
    if [[ -t 1 ]] || [[ -n "$CLICOLOR_FORCE" ]]; then
      $commands[grc] -es --colour=auto "$@"
    else
      "$@"
    fi
  }

  # assign the grc colours to the given command if it exists
  # Usage: _grc_assign COMMAND [ASSIGNMENT]
  _grc_assign() {
    local cmd="$1"
    if [ "$#" -gt 1 ]; then
      shift
    fi
    if (( $+commands[$cmd] )); then
      alias "$cmd"="colourify $*"
    fi
  }

  # Here is the list of commands mapped to themselves without options
  for cmd in ant as blkid cc cvs c++ df diff dig dnf \
             docker docker-compose docker-machine \
             du env free gas gcc getfacl getsebool g++ gmake \
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
  _grc_assign ls 'ls --color=auto'
  _grc_assign getsebool setsebool

  # This command needs run-time detection
  alias configure='[ -x ./configure ] && colourify ./configure'

  # Clean up variables
  unset cmd
fi
