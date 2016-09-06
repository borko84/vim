" Vim syntax file
" Language:    Diff (context or unified)
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last Change:    2010 Aug 03

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
scriptencoding utf-8


"#-------------------------------------------------------------------------------
"# color templates
"#-------------------------------------------------------------------------------
"hi         ctermfg=254        ctermbg=235        cterm=none        guifg=#f6f3e8    guibg=#242424    gui=none

hi my_lightblack   ctermfg=235      guifg=#242424
hi my_darkblack    ctermfg=232      guifg=#000000
hi my_darkblue     ctermfg=25       guifg=#4060a0
hi my_lightblue    ctermfg=74       guifg=#82cae6 gui=none
"hi my_lightblue_bold    ctermfg=74       guifg=#82cae6 gui=bold
hi my_red          ctermfg=167      guifg=#e5786d
hi my_green        ctermfg=113      guifg=#95e454
hi my_darkgreen    ctermfg=22       guifg=#215e21
hi my_yellow       ctermfg=226      guifg=#992222
hi my_orange       ctermfg=208      guifg=#cc7722
hi my_grey         ctermfg=244

hi my_error        guifg=#ffffff guibg=#e5786d


syn match ERR ".*\s$"

syn match CMNT    "^CMNT.*"
syn match FLT    "^SFLT.*"
syn match FLTNUM  "^SFLT;;"
syn match MRKT    "^MRKT.*"
syn match RULE    "^RULE.*"
syn match PRIC    "^PRIC.*"
syn match OFLT    "^OFLT.*"
"syn match OFLT_NUM "^OFLT;\w\+;"


hi def link CMNT   Comment
hi def link FLT    my_lightblue
hi def link OFLT   my_lightblue
"hi def link OFLT_NUM  my_lightblue_bold
hi def link MRKT   my_red
hi def link RULE   my_green
hi def link ERR    my_error




let b:current_syntax = "scd"
