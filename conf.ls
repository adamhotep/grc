# size, time (swap the colour assignment below to enable time)
# time also supports GNU ls --full-time dates between 1900-01-01 and 2199-12-31
regexp=^\s*(?:\S+\s+){0,4}(\d+(?:[.,]\d+)?[kKMG]?[bB]?)(?:[\s,]|$)([JFMASOND][aepuco][nbrylgptvc] [ 123][0-9] (?: (?:19|2[01])\d\d|[012]\d:[0-6]\d)|(?:19|2[01])\d\d-[01]\d-[0-3]\d [012]\d(?::[0-6]\d){2}(?:\.\d{9})? [+-]\d{4}\b)
#colours=unchanged,yellow,bold green
colours=unchanged,yellow,unchanged
=======
# root and other signs of privilege
# (works with alternate positions given GNU ls -G, GNU ls -g, and GNU ls -Gg)
regexp=^\s*(?:\S+\s+){2}(?:(adm(?:in)?|root|sudo|toor|wheel)|\S+)(?:[\s,]+|$)(?:(adm(?:in)?|root|sudo|toor|wheel)(?=[\s,]|$))?
colours=unchanged,bold red,bold red
=======
# root as UID/GID 0 (ls -n), avoiding size=0 (which is followed by the date)
regexp=^\s*(?:\S+\s+){2}(?:(?:(0)|\d+)(?:\s+(?:(0)|\d+))?\s(?![JFMASOND][aepuco]|(?:19|2[01])\d\d-[012]))?
colours=unchanged,bold red,bold red
=======
# Permissions rainbow: drwxrwxrwx is divided as (d)(rwx)(rwx)(rwx)
# with (blue)(green)(yellow)(red) for (type)(owner)(group)(other)
# Dashes are intentionally left without color
regexp=^(?:-|([bcCdDlMnpPs?]))(?:-|(r))(?:-|(w))(?:-|(\w))(?:-|(r))(?:-|(w))(?:-|(\w))(?:-|(r))(?:-|(w))(?:-|(\w))(?=[\s,]|$)
colours=unchanged,bold blue,bold green,bold green,bold green,bold yellow,bold yellow,bold yellow,bold red,bold red,bold red
