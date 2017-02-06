#!/bin/sh

set -e

PREFIX="$1"
ETCPREFIX="$2"
if [ -z "$PREFIX" ]; then
  PREFIX=/usr/local
fi


BINDIR="$PREFIX/bin"
LIBDIR="$PREFIX/share/grc"
MANDIR="$PREFIX/share/man"
CONFDIR="$ETCPREFIX/etc"
PROFILEDIR="$CONFDIR/profile.d"

_grc_install() {
  local TARGET="$1"
  shift
  mkdir -p "$TARGET"
  cp -fv "$@" "$TARGET"
}

_grc_install "$BINDIR" grc grcat
_grc_install "$LIBDIR" conf.*
_grc_install "$MANDIR/man1" grc.1 grcat.1
_grc_install "$CONFDIR" grc.conf
_grc_install "$PROFILEDIR" grc.bashrc grc.fish grc.zsh

# NOTE: this does not install the vim syntax highlighting file grc.vim.
# There does not appear to be a safe automated way to add this system-wide.
# Instead, follow the directions in the comments at the top of the file.
