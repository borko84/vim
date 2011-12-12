" Vim color file
" Original Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  2010-07-23
"
" Converting for 256-color terminals by
" Danila Bespalov (danila.bespalov@gmail.com)
" with great help of tool by Wolfgang Frisch (xororand@frexx.de)
" inspired by David Liang's version (bmdavll@gmail.com)

"set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "wombat256"


"#-------------------------------------------------------------------------------
"# color templates
"#-------------------------------------------------------------------------------

"lightblack	cterm=235	gui=#242424
"darkblack	cterm=232	gui=#000000
"darkblue	cterm=25	gui=#4060a0
"lightblue	cterm=74    gui=#82cae6  // 80 too bright // 111 problems with darkblue
"red		cterm=167	gui=#e5786d     
"green		cterm=113	gui=#95e454
"darkgreen	cterm=22	gui=#215e21
"yellow     cterm=226   gui=#992222
"orange     cterm=208   gui=#cc7722
"grey		cterm=244

"#-------------------------------------------------------------------------------
"# general colors
"#-------------------------------------------------------------------------------
hi Normal		ctermfg=254		ctermbg=235		cterm=none		guifg=#f6f3e8	guibg=#242424	gui=none
hi Cursor		ctermfg=none	ctermbg=241		cterm=none		guifg=NONE		guibg=#656565	gui=none
"hi Visual		ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=none
hi Visual		ctermfg=NONE	ctermbg=238		cterm=none		guifg=NONE		guibg=#383838	gui=none
"hi Folded		ctermfg=103		ctermbg=238		cterm=none		guifg=#a0a8b0	guibg=#384048	gui=none
"hi Folded		ctermfg=103		ctermbg=238		cterm=none		guifg=#5f625f	guibg=#252525	gui=none
hi Folded		ctermfg=103		ctermbg=238		cterm=none		guifg=#334433	guibg=#333344   gui=bold
"hi Title		ctermfg=7		ctermbg=none	cterm=bold		guifg=#f6f3e8	guibg=NONE		gui=bold
hi Title		ctermfg=7		ctermbg=none	cterm=bold		guifg=#f6f3e8	guibg=NONE		gui=bold
hi TabLine														guifg=#000000	guibg=#888888	gui=none
hi TabLineFill  												guifg=#000000 	guibg=#aaaaaa 	gui=none
"hi StatusLine	ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=italic
hi StatusLine	ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=bold
hi VertSplit	ctermfg=238		ctermbg=238		cterm=none		guifg=#444444	guibg=#444444	gui=none
hi StatusLineNC	ctermfg=243		ctermbg=238		cterm=none		guifg=#857b6f	guibg=#444444	gui=none
hi LineNr		ctermfg=243		ctermbg=232		cterm=none		guifg=#857b6f	guibg=#000000	gui=none
hi SpecialKey	ctermfg=244		ctermbg=236		cterm=none		guifg=#808080	guibg=#343434	gui=none
hi NonText		ctermfg=244		ctermbg=236		cterm=none		guifg=#808080	guibg=#303030	gui=none
hi Search		ctermfg=204	    ctermbg=226		cterm=bold		guifg=#992222   guibg=#cccc22	gui=bold



"#-------------------------------------------------------------------------------
"# Vim version >= 7.0 specific colors
"#-------------------------------------------------------------------------------
if version >= 700
hi CursorLine					ctermbg=236		cterm=none						guibg=#2d2d2d
hi MatchParen	ctermfg=7		ctermbg=243		cterm=bold		guifg=#f6f3e8	guibg=#857b6f	gui=bold
hi Pmenu		ctermfg=7		ctermbg=238						guifg=#f6f3e8	guibg=#444444
hi PmenuSel		ctermfg=0		ctermbg=192						guifg=#000000	guibg=#cae682
"hi PmenuSbar   ctermfg=7		ctermbg=0
"hi PmenuThumb  ctermfg=0 		ctermbg=7  
endif





"#-------------------------------------------------------------------------------
"# Syntax highlighting
"#-------------------------------------------------------------------------------
"hi Keyword		ctermfg=111		cterm=none		guifg=#8ac6f2	gui=none
"hi Statement	ctermfg=111		cterm=none		guifg=#8ac6f2	gui=none
hi Keyword		ctermfg=25		cterm=none		guifg=#4060a0	gui=none
hi Statement	ctermfg=25		cterm=none		guifg=#4060a0	gui=none

hi Constant		ctermfg=167		cterm=none		guifg=#e5786d	gui=none
hi Number		ctermfg=167		cterm=none		guifg=#e5786d	gui=none
hi PreProc		ctermfg=167		cterm=none		guifg=#e5786d	gui=none

"hi Function	ctermfg=192		cterm=none		guifg=#cae682	gui=none
"hi Identifier	ctermfg=192		cterm=none		guifg=#cae682	gui=none
"hi Type		ctermfg=192		cterm=none		guifg=#cae682	gui=none
hi Function		ctermfg=74		cterm=none		guifg=#82cae6	gui=none
hi Identifier	ctermfg=74		cterm=none		guifg=#82cae6	gui=none
hi Type			ctermfg=74		cterm=none		guifg=#82cae6	gui=none

hi Special		ctermfg=194		cterm=none		guifg=#e7f6da	gui=none
hi String		ctermfg=113		cterm=none		guifg=#95e454	gui=italic

"hi Comment		ctermfg=246		cterm=none		guifg=#448844	gui=italic
hi Comment		ctermfg=244		cterm=none		guifg=#99968b	gui=italic

"hi Todo   ctermfg=245			 cterm=none		guifg=#8f8f8f	gui=italic
hi Todo	   ctermbg=208 ctermfg=25 cterm=bold	guibg=#cc7722  guifg=#444444 gui=bold

" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine


"#---------------------------------------------------------------------------
"# InsertStatuslineColor
"#---------------------------------------------------------------------------
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatusLine ctermbg=22	guibg=#215e21
  elseif a:mode == 'r'
    hi StatusLine ctermbg=25	guibg=blue
  elseif a:mode == 'V'
    hi StatusLine ctermbg=226	guibg=violet
  elseif a:mode == 'v'
    hi StatusLine ctermbg=226	guibg=orange
"  elseif a:mode == ''
"    hi StatusLine ctermbg=204	guibg=red
  else
    hi StatusLine ctermbg=204	guibg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatusLine ctermbg=238 guibg=#444444


"#---------------------------------------------------------------------------
"# TagList
"#---------------------------------------------------------------------------
"#  TagListTagName  - Used for tag names
"#  TagListTagScope - Used for tag scope
"#  TagListTitle    - Used for tag titles
"#  TagListComment  - Used for comments
"#  TagListFileName - Used for filenames
"#---------------------------------------------------------------------------
hi MyTagListFileName ctermfg=113   cterm=none		guifg=#95e454	gui=italic
hi MyTagListTitle    ctermfg=25   cterm=none		guifg=#4060a0	gui=none 



"#---------------------------------------------------------------------------
"# Ifdef
"#---------------------------------------------------------------------------
hi IfdefColor		ctermbg=238	 ctermfg=25  cterm=none		guibg=#444444 guifg=#4060a0 gui=none 




"#---------------------------------------------------------------------------
"# ColorColumn
"#---------------------------------------------------------------------------
"if version >= 703
"hi ColorColumn	ctermbg=250	 guibg=#111111    
"endif     

" vim:set ts=4 sw=4 noet:
