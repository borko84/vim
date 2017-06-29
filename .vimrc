"-------------------------------------------------------------------------------
"
" Version: 13
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
"# vundle
"#--------------------------------------------------------------------------#{{{
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"#------------------------------------------------------------------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
"A (https://github.com/vim-scripts/a.vim)
"NERDCommenter (https://github.com/scrooloose/nerdcommenter)
"SuperTab (https://github.com/ervandew/supertab)
"Tagbar (https://github.com/majutsushi/tagbar)
"vim-airline (https://github.com/bling/vim-airline)
"UltiSnips (https://github.com/SirVer/ultisnips)
"vim-autoclose (https://github.com/Townk/vim-autoclose)
"vim-fugitive (https://github.com/tpope/vim-fugitive)
"vim-gitgutter (https://github.com/airblade/vim-gitgutter)
"vim-multiple-cursors (https://github.com/terryma/vim-multiple-cursors)

Plugin 'VundleVim/Vundle.vim'
"Plugin 'rip-rip/clang_complete'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'derekwyatt/vim-fswitch'

" fuf
" L9
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required


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
    set guifont=Liberation\ Mono\ 8
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

"#}}}"#-------------------------------------------------------------------------
"# Text Edition Settings
"#--------------------------------------------------------------------------#{{{
"set verbose=1           " see everything vim is doing
set clipboard=unnamedplus

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

map <C-h> :FSHere<cr>

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

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

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
:   autocmd FileType conf,fstab,make,cmake,txt,gitconfig let b:comment_leader = '#'
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


"#}}}"#-------------------------------------------------------------------------
"# path
"#--------------------------------------------------------------------------#{{{
set path+=**
set path+=~/workspace/ssi/trunk/unix/devl/include/**
set path+=~/workspace/ssi/trunk/unix/devl/src/**
set path+=/usr/include/boost/**

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
"# vimgrep
"#--------------------------------------------------------------------------#{{{
let g:ssi_path = "~/workspace/ssi/trunk/unix"
nnoremap <C-g> :silent grep! "<C-R><C-W>" ~/workspace/ssi/trunk/unix -r -i<CR>:copen<CR>
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

""#}}}"#-------------------------------------------------------------------------
" "# Command output in split
" "#--------------------------------------------------------------------------#{{{
" command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
" function! s:RunShellCommand(cmdline)
"   echo a:cmdline
"   let expanded_cmdline = a:cmdline
"   for part in split(a:cmdline, ' ')
"      if part[0] =~ '\v[%#<]'
"         let expanded_part = fnameescape(expand(part))
"         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
"      endif
"   endfor
"   botright new
"   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"   call setline(1, 'You entered:    ' . a:cmdline)
"   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
"   call setline(3,substitute(getline(2),'.','=','g'))
"   execute '$read !'. expanded_cmdline
"   setlocal nomodifiable
"   1
" endfunction

:source ~/.vim/.vimrc_plugins
