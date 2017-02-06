# size, time (swap the colour assignment with the comment below to enable time)
# "size" also supports LANANA Linux Device Lists' device major and minor numbers
# time also supports GNU ls --full-time dates between 1900-01-01 and 2199-12-31
regexp=^\s*(?:\S+\s+){0,4}(?:(\d+),\s+)?(\d+(?:[.,]\d+)?[kKMGT]?[bB]?)(?:[\s,]|$)([JFMASOND][aepuco][nbrylgptvc] [ 123][0-9] (?: (?:19|2[01])\d\d|[012]\d:[0-6]\d)|(?:19|2[01])\d\d-[01]\d-[0-3]\d [012]\d(?::[0-6]\d){2}(?:\.\d{9})? [+-]\d{4}\b)
#colours=unchanged,bright_yellow,yellow,bold green
colours=unchanged,bright_yellow,yellow,unchanged
=======
# root and other signs of privilege
# (works with alternate positions given GNU ls -G, GNU ls -g, and GNU ls -Gg)
regexp=^\s*(?:\S+\s+){2}(?:(adm(?:in)?|root|sudo|toor|wheel)|\S+)(?:[\s,]+|$)(?:(adm(?:in)?|root|sudo|toor|wheel)(?=[\s,]|$))?
#colours=unchanged,bold red white on_red,bold white on_red
colours=unchanged,bold red,bold red
=======
# root as UID/GID 0 (ls -n), avoiding size=0 (which is followed by the date)
regexp=^\s*(?:\S+\s+){2}(?:(?:(0)|\d+)(?:\s+(?:(0)|\d+))?\s(?![JFMASOND][aepuco]|(?:19|2[01])\d\d-[012]))?
colours=unchanged,bold red,bold red
=======
# SELinux
regexp=(\w+_u):(\w+_r):(\w+_t):(\w\d)
colours=default,green,yellow,cyan,magenta
-
# Permissions rainbow: drwxrwxrwx is divided as (d)(rwx)(rwx)(rwx)
# with (blue)(green)(yellow)(red) for (type)(owner)(group)(other)
# Dashes are intentionally left without color
# Bold is used for nonstandard executable bits (s,S,t,T rather than x)
regexp=^(?:-|([bcCdDlMnpPs?]))(?:-|(r))(?:-|(w))(?:-|(x)|(\w))(?:-|(r))(?:-|(w))(?:-|(x)|(\w))(?:-|(r))(?:-|(w))(?:-|(x)|(\w))(?=[\s,]|$)
colours=unchanged,bold white,bright_green,bright_green,bright_green,bold green,yellow,yellow,yellow,bold yellow,bright_red,bright_red,bright_red,bold red
-
# ACL
regexp=^\S{10}(\+)
colours=unchanged,on_cyan bold white
