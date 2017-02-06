#!/usr/bin/env fish
# Main File: ~/.local/share/omf/pkg/grc/init.fish
# echo $grc_plugin_execs

set -U grc_plugin_execs cat ls \
               ant as blkid cc cvs c++ df diff dig dnf \
               docker docker-compose docker-machine \
               du env free gas gcc getfacl getsebool g++ gmake \
               hd head hexdump ifconfig ioping iostat ip iptables \
               journalctl last ld ldap lsattr lsblk lsmod lspci \
               make mount mtr mvn netstat nmap oping ping ping6 \
               ps sar semanage setsebool showmount ss stat \
               sysctl systemctl tail tcpdump traceroute traceroute6 \
               tune2fs ulimit uptime vmstat w who wdiff
