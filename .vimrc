"-------------------------------------------------------------------------------
"
" Version: 12
" Author: Piotr Borkowski
" Created:  Nov 2003 10:20:19
" Last-modified: 10.12.2010
"
"-------------------------------------------------------------------------------
"
" to see whats under mapping
"   :verbose map <C-j>
"
"-------------------------------------------------------------------------------
" Defining commands:
"   command! AutoCloseOn :let s:running = 1
"-------------------------------------------------------------------------------
"#{{{


"#}}}"#-------------------------------------------------------------------------
"# general settings
"#--------------------------------------------------------------------------#{{{

cd ~
colorscheme wombat256
set t_Co=256                       "without this line tmux/screen will do *bad* things to colors, dude

if has("win32")                    "system
   set guifont=Courier\ New:h9
   winpos 50 80
   set lines=50 columns=140
   set encoding=utf-8                   "needed for win
else
    set guifont=Liberation\ Mono\ 7.1
endif

if has("gui_running")
   behave mswin
   set guioptions=a
endif

"jump to the last position when reopening a file
if has("autocmd")
   autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
endif

"indentation rules and plugins(filetype)
syntax on
filetype plugin indent on


"#}}}#---------------------------------------------------------------------------
"#    pathogen
"#---------------------------------------------------------------------------#{{{
"#   Submodule add
"#       > git rm -r .vim/bundle/fugitive
"#       > git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive
"#   Register :
"#       > git submodule init
"#       > git submodule update
"#       > git submodule update --init --recursive
"#   Remove submodule:
"#       remove references in .gitmodules
"#                            .git/config.
"#       > git rm --cached .vim/bundle/fugitive
"#   Update all:
"#       git submodule foreach git pull origin master
"#--------------------------------------------------------------------------------
call pathogen#infect()
call pathogen#helptags()


"#}}}"#-------------------------------------------------------------------------
"# Text Edition Settings
"#--------------------------------------------------------------------------#{{{
"set verbose=1           " see everything vim is doing

"spaces
set tabstop=3           " n-space tabs
set shiftwidth=3        " n-spaces when text is indented
set softtabstop=3

"others
set autochdir           " path = path of the edited file
set backspace=indent,eol,start
set expandtab           " spaces instead of tab
set guicursor=a:blinkwait0    " non blinking cursor
set hidden              " Hide buffers when they are abandoned
set history=1000        " remember more commands and search history
set undolevels=1000     " use many muchos levels of undo
set virtualedit=all     " let the cursor stray beyond the defined text.
set hlsearch incsearch  " Incremental search - "b" = go to the first "b" ; type "o," go to "bo"
set ignorecase          " ignorecase (Case insensitive search)
set laststatus=2        " Always display a statusline
set mouse=a             " Enable mouse usage (all modes)
set nocompatible        " Use Vim settings
set number              " Line Numbering
set showbreak=~         " Show break char
set showcmd             " Show (partial) command in status line
set showmatch           " Show matching brackets
set smartcase           " /The search for "The", while /the would find "the" or "The" etc
set visualbell t_vb=    " Flash instead of beep
set nowrap
set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:. ",eol:$
set listchars+=precedes:~,extends:~ " nice indicators that there is more text horizontally

set scrolljump=7
set sidescroll=5        "when moving in the file horizontally move 5 columns a time
"set showbreak=>        " Show break char
set wildmode=longest:full
set wildmenu

let mapleader = ","

"#}}}"#-------------------------------------------------------------------------
"# Statusline
"#--------------------------------------------------------------------------#{{{
set statusline=[%n]
set statusline+=\ \ %f%m%r%h:%l
set statusline+=\ \ \ \ \ \ {\ %p%%\ }
set statusline+=\ %=
set statusline+=\ %{strftime(\"%H:%M\ \%d\.%m\",getftime(expand(\"%:p\")))}
set statusline+=\ \ <\ %l:%c\ >
set statusline+=\ \ %y
set statusline+=[%{&ff}]

"#}}}"#-------------------------------------------------------------------------
"# Folding
"#--------------------------------------------------------------------------#{{{
set foldlevelstart=20
set foldnestmax=1
set foldmethod=marker

:augroup folding
:  autocmd!
:  autocmd FileType sh,ksh,awk,vim,make,conf,txt,snippet set foldmethod=marker
:augroup END

let g:folding_flag = 0
function! FoldingToggle()
   execute g:folding_flag ? 'normal! zR' : 'normal! zM'
   let g:folding_flag = !g:folding_flag
endfunction
nnoremap <leader>f :call FoldingToggle()<CR>

"#}}}"#-------------------------------------------------------------------------
"#  key mapping
"#--------------------------------------------------------------------------#{{{
nnoremap ; :

nnoremap <C-c> yiw
nnoremap <C-x> yiwdiw

"tabs
nnoremap tn :tabnew <CR>
nnoremap Q :q!<CR>
nnoremap Z :w!<CR> :call SmallCls()<CR>

noremap <C-a> ggVG
vnoremap < <gv
vnoremap > >gv

noremap <xCSI>[62~ <MouseDown>

"closing braces
inoremap (<Tab>  ()<Left>
inoremap {<Tab>  {}<Left>
inoremap "<Tab>  ""<Left>
inoremap '<Tab>  ''<Left>
inoremap [<Tab>  []<Left>
inoremap <<Tab>  <><Left>

nnoremap tt :wincmd w <Esc>

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" same when jumping to changes!
nnoremap g; g;zz
nnoremap g, g,zz

"#}}}#---------------------------------------------------------------------------
"#   visually selected text
"#---------------------------------------------------------------------------#{{{
nnoremap * viwy/<C-r>0<CR>:set hlsearch<CR>N

"#}}}"#-------------------------------------------------------------------------
"# sed & regexp
"#--------------------------------------------------------------------------#{{{
noremap ;; :set hlsearch<CR>:.,$s//gc<Left><Left><Left>
cnoremap ;w (\w+)
cnoremap ;s (\s\+)
cnoremap ;d (\d\+)
cnoremap ;. (.*)
cnoremap ;- (.{-})
cnoremap ;! ()\@!<Left><Left><Left><Left><Left>
cnoremap ;n (\n+)
cnoremap ;' ()<Left>
cnoremap ;< <><Left>
cnoremap ;x <\>\(.*\)\</<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


"#}}}"#-------------------------------------------------------------------------
"# clearing function
"#--------------------------------------------------------------------------#{{{
function! SmallCls()
   exec ':%s/\(\s\+\)$//ge'
   "# remove end-of-file empty lines
   exec ':%s#\($\n\s*\)\+\%$##e'
endfunc

"#}}}"#-------------------------------------------------------------------------
"# autocmd
"#--------------------------------------------------------------------------#{{{
:augroup comments
:   autocmd!
:   autocmd FileType sh,ruby,awk,perl let b:comment_leader = '#'
:   autocmd FileType conf,fstab,make,txt,gitconfig let b:comment_leader = '#'
:   autocmd FileType tex                     let b:comment_leader = '%'
:   autocmd FileType mail                    let b:comment_leader = '>'
:   autocmd FileType vim                     let b:comment_leader = '"'
:   autocmd FileType sql,haskell             let b:comment_leader = '--'
:   autocmd FileType xml                     let b:comment_leader = '<!-- -->'
:   autocmd FileType scd                     let b:comment_leader = 'CMNT;'
:augroup END

function! NewComment() range
    " check if commented
    let myline = getline(".")
    let commented = 1
    for i in range(0, strlen(b:comment_leader)-1)
       if b:comment_leader[i] != myline[i]
          let commented = 0
       endif
    endfor

    " comment
    for linenum in range(a:firstline, a:lastline)
       let myline = getline(linenum)
       if commented==0
          let new_line = substitute(myline, '^', b:comment_leader, 'g')
       else
          let new_line = substitute(myline, '^'.b:comment_leader,'', 'g')
       endif
       call  setline(linenum, new_line)
    endfor
endfunction

vnoremap / :call NewComment()<CR>
vnoremap ? :call NewComment()<CR>

" SCD
au BufRead,BufNewFile *.scd setfiletype scd

"#}}}"#-------------------------------------------------------------------------
"#      Neocomplcache
"#--------------------------------------------------------------------------#{{{
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 0
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_enable_smart_case = 1            " smartcase
"let g:neocomplcache_enable_camel_case_completion = 1 " camel case

" Plugin key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"inoremap <expr><C-g>  neocomplcache#undo_completion()
" FIXME use <C-n>, <C-p> or <C-j>, <C-k> to select from popup.


"#}}}"#-------------------------------------------------------------------------
"# NERDTree
"#--------------------------------------------------------------------------#{{{
let NERDTreeWinPos="right"
let NERDTreeDirArrows=0
let NERDTreeMouseMode=1
nnoremap <silent> <C-e> <Esc>:NERDTreeToggle . <CR> <C-w> l

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd! WinEnter * call NERDTreeQuit()

"#}}}"#-------------------------------------------------------------------------
"#
"#-------------------------------------------------------------------------"#{{{
:augroup my_functions
:  autocmd!
:  autocmd FileType perl      noremap <F9> :w<CR>:!perl %<CR>
:augroup END

noremap <F10>   :call Synchronize()<CR>

function! Synchronize()
  exec ':%s/\(\s\+\)$//gc'
  exec "w | !bash /home/sg216005/bin/smake"
endfunc


"#}}}"#=========================================================================
"#                              C++ setttings
"#==========================================================================#{{{

"#}}}"#-------------------------------------------------------------------------
"# path
"#--------------------------------------------------------------------------#{{{
set path+=~/workspace/ssi/trunk/unix/devl/include/**
set path+=~/workspace/ssi/trunk/unix/devl/src/**
set path+=/usr/include/boost/**

"#}}}"#-------------------------------------------------------------------------
"#  CtrlP
"#--------------------------------------------------------------------------#{{{
let g:ctrlp_map = 'F7'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_use_caching = 1     " <F5> while inside |CtrlP| will purge the cache
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.metadata\|\.git\|\.project\|\.cproject\|\.directory|\.o$'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']

function! CheckPath()
   exec ':CtrlP ~/workspace/ssi/trunk/unix'
endfunction

nnoremap <C-p> :call CheckPath()<CR>
nnoremap <C-t> :CtrlPTag<CR>


"#}}}"#-------------------------------------------------------------------------
"# TagList
"#--------------------------------------------------------------------------#{{{
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let TlistHighlightTag = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Show_Menu = 1

let g:tagbar_sort = 0
let g:tagbar_compact  = 0

noremap <S-F4> :TlistToggle<CR>
noremap <F4> :TagbarToggle<CR>



au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest  ",preview  "for scratch window
inoremap <C-o> <C-x><C-o>
inoremap <C-u> <C-x><C-u>
inoremap <C-space> <C-x><C-u>
inoremap <C-n> <C-x><C-n>
inoremap <C-f> <C-x><C-f>
"automatically run down if omnicomplete
inoremap <expr> <space> ((pumvisible())?("\<Down>"):("<space>"))


"#}}}"#-------------------------------------------------------------------------
"# Diff
"#--------------------------------------------------------------------------#{{{
noremap <space> ]cz.
noremap <S-space> [cz.
noremap <leader>dt :call RunDiff()<CR>
noremap <leader>du :diffupdate<CR>

function! RunDiff()
   if &diff
      exec ":wincmd w | set nodiff"
      exec ":wincmd w | set nodiff"
   else
      exec ":wincmd w | diffthis"
      exec ":wincmd w | diffthis | normal! gg ]cz."
   endif
endfunction

if &diff
   let g:clang_periodic_quickfix=0
   if has("gui_running")
      exec "winpos 50 50 | set lines=70 | set columns=160"
   endif
endif


"#}}}"#-------------------------------------------------------------------------
"# FuzzyFinder
"#--------------------------------------------------------------------------#{{{
noremap <C-f> :FufRenewCache<CR>:FufFile<CR>


"#}}}"#-------------------------------------------------------------------------
"# BufExplorer
"#--------------------------------------------------------------------------#{{{
"#Sort by:
"#   'extension', 'fullpath', 'mru' (recently used), 'name, 'number'
"#-------------------------------------------------------------------------
let g:bufExplorerSortBy='name'
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSplitBelow = 0

noremap <C-b> :BufExplorer<CR>


"#}}}"#-------------------------------------------------------------------------
"# vimgrep
"#--------------------------------------------------------------------------#{{{
let g:ssi_path = "~/workspace/ssi/trunk/unix"
nnoremap <C-g> :silent grep! "<C-R><C-W>" /home/sg216005/workspace/ssi/trunk/unix -r -i<CR>:copen<CR>
nnoremap ' :silent grep! <C-r>/ /home/sg216005/workspace/ssi/trunk/unix -r -i<CR>:copen<CR>

"#}}}#---------------------------------------------------------------------------
"#    binary
"#---------------------------------------------------------------------------#{{{
let g:bin_flag = 0
function! BinToggle()
   exec g:bin_flag==0 ? ":%!xxd" : ":%!xxd -r"
   let g:bin_flag = !g:bin_flag
endfunction
nnoremap <leader>b :call BinToggle()<CR>

"#}}}#---------------------------------------------------------------------------
"#    vimrc
"#---------------------------------------------------------------------------#{{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

noremap J :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
noremap K :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

inoremap kj <esc>
vnoremap kj <esc>

"#}}}"#-------------------------------------------------------------------------
"# Command output in split
"#--------------------------------------------------------------------------#{{{

"funct! Exec(comand)
"    redir =>output
"    silent a:comand
"    redir END
"    return output
"endfunct!

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
