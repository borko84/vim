" Vim syntax file
" Language:	generic configure file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2005 Jun 20

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword	confTodo	contained TODO FIXME XXX
" Avoid matching "text#text", used in /etc/disktab and /etc/gettytab
syn match	confComment	"^#.*" contains=confTodo
syn match	confComment	"\s#.*"ms=s+1 contains=confTodo
syn region	confString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region	confString	start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link confComment	Comment
hi def link confTodo	Todo
hi def link confString	String

hi Folded        ctermfg=103     ctermbg=238     cterm=none        guibg=#999999    guifg=#393939    gui=none

let b:current_syntax = "conf"

" vim: ts=8 sw=2
