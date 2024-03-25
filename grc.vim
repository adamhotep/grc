" Vim syntax file
" Language: GRC generic colouriser configuration file
" Maintainer: Adam Katz
" Website: https://github.com/adamhotep/grc
" Version: 0.2+20170121
" License: GNU GPL v2+
" Copyright: (c) 2016+ by Adam Katz

" To install, save this file as ~/.vim/syntax/grc.vim
" and add the following to your ~/.vim/filetype.vim:
"
"     augroup filedetect
"         au BufRead,BufNewFile */{.,}grc/conf.* setfiletype grc
"     augroup END

if version < 600
  echo "Vim 6 or later is needed for this syntax file"
  finish " ... note that 'finish' isn't vim-5 compatible...
endif

if exists("b:current_syntax")
  finish
endif

" Regular expression matching from perl
syn include @perlInterpSlash	syntax/perl.vim

syn match grcLine	"^"	nextgroup=grcComment,grcKeyword

syn match grcComment	"#.*"	contained

syn keyword grcKeyword	regexp  contained nextgroup=grcEqRegexp
  syn match grcEqRegexp	"="	contained nextgroup=grcRegexp
  syn match grcRegexp	".*"	contained contains=perlSpecialString,perlSpecialMatch

syn keyword grcKeyword	colours contained nextgroup=grcEqColour
  syn match grcEqColour	"="	contained nextgroup=grcColour
  syn match grcColour	".*"	contained contains=grcCodes
  syn keyword grcCodes	previous unchanged none default 		contained
  syn keyword grcCodes	bold underline blink reverse concealed		contained
  syn keyword grcCodes	black green yellow blue magenta cyan white red	contained
  syn keyword grcCodes	on_black on_green on_yellow on_blue		contained
  syn keyword grcCodes	on_magenta on_cyan on_white on_red		contained
  syn keyword grcCodes	beep dark italic rapidblink strikethrough	contained
  syn match   grcCodes	/"[^"]*"/	contained

syn keyword grcKeyword	command skip replace count contained nextgroup=grcEquals
  syn match grcEquals	"="	contained nextgroup=grcValue
  syn match grcValue	".*"	contained


hi def link grcComment	Comment
hi def link grcEquals	Operator
hi def link grcKeyword	Type
hi def link grcRegexp	String
hi def link grcValue	String
hi def link grcCodes	Number

