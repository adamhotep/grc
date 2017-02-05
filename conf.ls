# size
#regexp=(\s|^)\d+([.,]\d+)?\s?([kKMG][bB]|[bB]|[kKMG])(?=[\s,]|$)
regexp=^\s*(?:\S+\s+){0,4}(\d+(?:[.,]\d+)?[kKMG]?[bB]?)(?=[\s,]|$)(?!  ?[012]\d:[0-5]\d \S|  20\d\d \S)
colours=unchanged,yellow
=======
# time
#regexp=(\s|^)\d+(:\d+)+(?=[\s,]|$)
#colours=bold green
#=======
# mounth
#regexp=\s[a-z]{3}\s
#colours=yellow
#=======
#regexp=(?<=\d):(?=\d)
#colours=bold yellow
#=======
# root
#regexp=root|wheel(?=\s|$)
regexp=^\s*(?:\S+\s+){2,3}?((?:root|wheel)(?:\s+(?:root|wheel))?)(?=\s|$)
colours=unchanged,bold red
=======
# -rwxrwxrwx 
regexp=(-|([bcCdDlMnpPs?]))(?=[-r][-w][-xsStT][-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bold blue
=======
regexp=(?<=[-bcCdDlMnpPs?])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT][-r][-w][-xsStT])
colours=unchanged,unchanged,bold green,unchanged,bold green,unchanged,bold green
=======
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))(?=[-r][-w][-xsStT])
colours=unchanged,unchanged,bold yellow,unchanged,bold yellow,unchanged,bold yellow
=======
regexp=(?<=[-bcCdDlMnpPs?][-r][-w][-xsStT][-r][-w][-xsStT])(-|(r))(-|(w))(-|([xsStT]))
colours=unchanged,unchanged,bold red,unchanged,bold red,unchanged,bold red
