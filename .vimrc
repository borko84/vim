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
:  autocmd FileType python                               set foldmethod=indent
:  autocmd FileType c,cpp                                set foldmethod=syntax
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
nnoremap @@ @:

nnoremap <C-c> yiw
nnoremap <C-x> yiwdiw
"nnoremap <C-v> viw"0p
"vnoremap <C-v> "_d"0P
nnoremap F viw"0p
vnoremap F "_d"0P

"tabs
nnoremap tn :tabnew <CR>
nnoremap Q :q!<CR>
nnoremap Z :w!<CR> :call SmallCls()<CR>
nnoremap BD :bd! %<CR>

"vnoremap <C-c> "+y
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
nnoremap <leader>t :wincmd w <Esc>

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
" same when jumping to changes!
nnoremap g; g;zz
nnoremap g, g,zz

"hlsearch
nnoremap <leader>cp :set hlsearch! hlsearch? <CR>

"#}}}#---------------------------------------------------------------------------
"#   visually selected text
"#---------------------------------------------------------------------------#{{{
nnoremap * viwy/<C-r>0<CR>:set hlsearch<CR>N
set iskeyword=@,48-57,_,192-255,#



"#}}}"#-------------------------------------------------------------------------
"# sed & regexp
"#--------------------------------------------------------------------------#{{{
"
"    \d    digit                   [0-9]
"    \D    non-digit               [^0-9]
"    \x    hex digit               [0-9a-fA-F]
"    \X    non-hex digit           [^0-9a-fA-F]
"    \s    white space             [    ]     (<Tab> and <Space>)
"    \S    non-white characters    [^     ]   (not <Tab> and <Space>)
"    \l    lowercase alpha         [a-z]
"    \L    non-lowercase alpha     [^a-z]
"    \u    uppercase alpha         [A-Z]
"    \U    non-uppercase alpha     [^A-Z]
"    \h                            [A-Za-z_]
"    \w                            [0-9A-Za-z_]
"
"#-------------------------------------------------------------------------------
noremap ;; :set hlsearch<CR>:.,$s//gc<Left><Left><Left>

" fast 'w'=word, 's'=space, 'd'=digit, '.'=any
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

function! Cls()
   "# remove unwanted spaces at end-of-line
   exec ':%s/\(\s\+\)$//gce'
   "# change tabs to 4 spaces
   exec ':%s/\t/    /gce'
   "# remove windows eol
   exec ':%s/\r//gce'
   "# remove end-of-file empty lines
   exec ':%s#\($\n\s*\)\+\%$##e'
endfunc
nnoremap <leader>cls :call Cls()<CR>


"#}}}"#-------------------------------------------------------------------------
"# autocmd
"#--------------------------------------------------------------------------#{{{
:augroup comments
:   autocmd!
:   autocmd FileType c,cpp,java,actionscript let b:comment_leader = '//'
:   autocmd FileType sh,ruby,python,awk,perl let b:comment_leader = '#'
:   autocmd FileType conf,fstab,make,txt,gitconfig let b:comment_leader = '#'
:   autocmd FileType tex                     let b:comment_leader = '%'
:   autocmd FileType mail                    let b:comment_leader = '>'
:   autocmd FileType vim                     let b:comment_leader = '"'
:   autocmd FileType sql,haskell             let b:comment_leader = '--'
:   autocmd FileType xml                     let b:comment_leader = '<!-- -->'
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
"vnoremap / :s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"vnoremap ? :s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"#}}}"#-------------------------------------------------------------------------
"#    SCD
"#--------------------------------------------------------------------------#{{{
au BufRead,BufNewFile *.scd setfiletype scd
au FileType scd   let b:comment_leader = 'CMNT;'


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
"# autoclose
"#--------------------------------------------------------------------------#{{{
"autocmd VimEnter * AutoCloseOff
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
"let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]


"#}}}#---------------------------------------------------------------------------
"#   f keys
"#---------------------------------------------------------------------------#{{{
noremap <F2>    :mks! ~/session.vim
noremap <F3>    :so ~/session.vim

"Gundo
if version >= 703
    nnoremap <F6> :GundoToggle<CR>
endif

"run script
"nnoremap <silent> <f5>:!# <CR>

"#}}}"#-------------------------------------------------------------------------
"# Compile and run C++
"#-------------------------------------------------------------------------"#{{{
"# cd %:p:h
"#------------------------------------------------------------------------------
:augroup my_functions
:  autocmd!
:  autocmd FileType c,cpp    noremap <F9>    :call CompileRunGpp()<CR>
:  autocmd FileType c,cpp    noremap <S-F9>  :call Cgdb()<CR>
:  autocmd FileType c,cpp    noremap <C-F10> :call MakeClean()<CR>
:  autocmd FileType c,cpp    noremap <F11>   :call Run()<CR>
:
:  autocmd FileType python    noremap <F9> :w<CR>:!python %<CR>
":  autocmd FileType perl      noremap <F9> :w<CR>:silent !r_run_perl.sh % 2>&1 \| tee ~/tmp/output<CR>:vsplit ~/tmp/output<CR>:redraw!<CR>
:  autocmd FileType perl      noremap <F9> :w<CR>:!perl %<CR>
:augroup END

noremap <F10>   :call Synchronize()<CR>

function! Synchronize()
  exec ':%s/\(\s\+\)$//gc'
"  exec "w | !bash /home/sg216005/bin/rsync.sh"
  exec "w | !bash /home/sg216005/bin/smake"
endfunc

function! CompileRunGpp()
  exec "w | !g++ -Wall  -g % -o %< -lboost_system -lboost_thread"
  exec "! ./%<"
endfunc

function! Make()
  exec "w | ! cd .. && make all"
endfunc

function! MakeClean()
  exec "w | ! cd .. && make clean && make"
endfunc

function! Run()
  exec "w | ! cd .. && ./run"
endfunc

"noremap <F9>  :w<CR>:silent !chmod +x %:p<CR>:silent !%:p 2>&1 \| tee ~/tmp/output<CR>:vsplit ~/tmp/output<CR>:redraw!<CR>:

"#}}}"#-------------------------------------------------------------------------
"# switch between header/source with
"#--------------------------------------------------------------------------#{{{
:augroup header_switch
:  autocmd!
:  autocmd BufEnter *.cpp let b:fswitchdst = 'h,hpp'
:  autocmd BufEnter *.cxx let b:fswitchdst = 'h,hpp'
:  autocmd BufEnter *.h   let b:fswitchdst = 'cpp,cxx,C'
:  autocmd FileType c,cpp  noremap <C-h> :FSHere<cr>
:augroup END

"#}}}"#-------------------------------------------------------------------------
"# ifndef regions
"#--------------------------------------------------------------------------#{{{
hi link IfdefReg IfdefColor

let g:ifdef_highlight = 0
function! IfdefToggle()
   if g:ifdef_highlight
       syn clear IfdefReg
   else
       syn region IfdefReg start="^\s*#ifdef" end="^\s*#endif\(.*\)$"
   endif
   let g:ifdef_highlight = !g:ifdef_highlight
endfunction

:augroup ifdef
:  autocmd!
:  autocmd FileType c,cpp call IfdefToggle()
:  autocmd FileType c,cpp nnoremap <leader>i :call IfdefToggle()<CR>
:augroup END



"#}}}"#=========================================================================
"#                              C++ setttings
"#==========================================================================#{{{

"#}}}"#-------------------------------------------------------------------------
"# path
"#--------------------------------------------------------------------------#{{{
set path+=~/workspace/ssi/trunk/unix/devl/include/**      "ssi include
set path+=~/workspace/ssi/trunk/unix/devl/src/**          "ssi src
set path+=/usr/include/boost/**
"set path+=C:/versant/7_0_1/h/**
"set path+=c:\cygwin\lib\gcc\i686-pc-cygwin\3.4.4\include\c++\**


"#}}}"#-------------------------------------------------------------------------
"# tags dirs
"#--------------------------------------------------------------------------#{{{
"#}}}"#-------------------------------------------------------------------------
"# Ctags
"#--------------------------------------------------------------------------#{{{
"# C++:
"#    ctags -R --c++-kinds=+p --fields=+iaS --extra=+q "
"#        --extra=+q"      - to qualify member function/variable with its class type.
"#        --c++-kinds=+p"  -
"#        --fields=+iaS"   -
"#        -R"              -
"#
"# Python:
"#      ctags -R –python-kinds=-i -f ~/.vim/tags/python26.ctags /Python26
"#
"#------------------------------------------------------------------------------
"set tags=tags,tags+=tags;/
""set tags+=..\..\tags
"set tags+=~/workspace/ssi/unix/devl/tags
"set tags+=~/workspace/ssi/unix/test/tags
"set tags+=C:/versant/7_0_1/h/tags
""set tags+=C:/src/boost_1_48_0/boost/tags
"set tags+=~\vimfiles\tags\std_tags
"
"
"autocmd FileType python     set tags+=/.vim/tags/python26.ctags
"
"
":augroup ctags
":  autocmd!
":  autocmd FileType python    set tags+=/.vim/tags/python26.ctags
":  autocmd FileType python    noremap <F8> :!/usr/bin/ctags -R --languages=python --python-kinds=-i . <CR>
"
":  autocmd FileType c,cpp     set tags+=/usr/include/c++/tags
":  autocmd FileType c,cpp     noremap <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
":  autocmd FileType c,cpp     noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
":  autocmd FileType c,cpp     noremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
":augroup END


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


"#}}}"#-------------------------------------------------------------------------
"# clang
"#--------------------------------------------------------------------------#{{{
let g:clang_library_path="/usr/lib/llvm-3.6/lib/"
let g:clang_use_library=1
let g:clang_auto_select=1           "select first entry in popup menu but don't insert in code
let g:clang_complete_auto=1         "auto complete after -> . and ::
let g:clang_complete_copen=1        "open quick fix on error
let g:clang_complete_hl_errors=1    " highlight errors and warnings
let g:clang_periodic_quickfix=1     " update quickfix periodically
let g:clang_trailing_placeholder=1  " add trailing placeholder after function
let g:clang_close_preview=1         " close preview window after completion
let g:clang_user_options='-I/usr/include/boost'
let g:clang_snippets=1              " some magic after function ( or ,
"let g:clang_snippets_engine='snipmate'
let g:clang_debug=1

"nnoremap <f5> :call g:ClangUpdateQuickFix()<CR>
nnoremap <f5> :wincmd K<CR> :let g:clang_periodic_quickfix=1<CR> :call g:ClangUpdateQuickFix()<CR>

""#}}}"#-------------------------------------------------------------------------
""# omnicomplete - cpp
""#--------------------------------------------------------------------------#{{{
"let OmniCpp_GlobalScopeSearch   = 1
"let OmniCpp_DisplayMode         = 1
"let OmniCpp_NamespaceSearch     = 1
"let OmniCpp_ShowAccess          = 1 " show access in pop-up
"let OmniCpp_ShowPrototypeInAbbr = 1 " show prototype in pop-up
"let OmniCpp_ShowScopeInAbbr     = 0 " do not show namespace in pop-up
"let OmniCpp_SelectFirstItem     = 1 " select first item in pop-up
"let OmniCpp_MayCompleteDot      = 1 " auto .
"let OmniCpp_MayCompleteArrow    = 1 " auto ->
"let OmniCpp_MayCompleteScope    = 1 " auto ::
"
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

:augroup omnigroup
:  autocmd!
:  autocmd FileType python     set omnifunc=pythoncomplete#Complete
:  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
:  autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
:  autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
:augroup END


au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest  ",preview  "for scratch window
inoremap <C-o> <C-x><C-o>
inoremap <C-u> <C-x><C-u>
inoremap <C-space> <C-x><C-u>
inoremap <C-n> <C-x><C-n>
inoremap <C-f> <C-x><C-f>
"automatically run down if omnicomplete
inoremap <expr> <space> ((pumvisible())?("\<Down>"):("<space>"))


"#}}}"#=========================================================================
"#                         PYTHON setttings
"#==========================================================================#{{{

"#}}}"#-------------------------------------------------------------------------
"# omnicomplete - python
"#--------------------------------------------------------------------------#{{{
let g:pydiction_location = 'usr/share/vim/vim72/ftplugin/pydiction/complete-dict'

" <silent> py !python %
"autocmd! FileType python setlocal columns=100
autocmd! FileType python set completeopt=menuone,menu,longest,preview


"`gf` jumps to the filename under the cursor.  Point at an import statement
"and jump to it!
"python << EOF
"import os
"import sys
"import vim
"
"sys.path.append("/usr/lib/python3.1/")
"sys.path.append("/usr/lib/python3.1")
"sys.path.append("/usr/lib/python3.1/plat-linux2")
"sys.path.append("/usr/lib/python3.1/lib-dynload")
"sys.path.append("/usr/lib/python3.1/dist-packages")
"sys.path.append("/usr/local/lib/python3.1/dist-packages")
"
"for p in sys.path:
"    if os.path.isdir(p):
"        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF



"#}}}"#-------------------------------------------------------------------------
"# LateX
"#--------------------------------------------------------------------------#{{{
"if has("unix")
"elseif has("win32")
"   cd d:/workspace/latex/
"endif

filetype plugin on          " REQUIRED: This makes vim invoke Latex-Suite when you open a tex file
set shellslash              " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
                            "   can be called correctly.
"set grepprg=grep\ -nH\ $*   " IMPORTANT: grep will sometimes skip displaying the file name if you
"                            "   search in a singe file. This will confuse Latex-Suite. Set your grep
"                            "   program to always generate a file-name
filetype indent on          " OPTIONAL: This enables automatic indentation as you type
let g:tex_flavor='latex'    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
                            "   'plaintex' instead of 'tex', which results in vim-latex not being loaded.
                            "   The following changes the default filetype back to 'tex':
"set sw=2                   "   this is mostly a matter of taste. but LaTeX looks good with just a bit
                            "   of indentation.
"set iskeyword+=:            " TIP: if you write your \label's as \label{fig:something}, then if you
"                            "   type in \ref{fig: and press <C-n> you will automatically cycle through
"                            "   all the figure labels. Very useful!

"#}}}"#-------------------------------------------------------------------------
"# CScope
"#--------------------------------------------------------------------------#{{{
"#
"# -b: just build
"# -q: create inverted index
"#
"#-------------------------------------------------------------------------
"#    #!/bin/sh
"#    find . -name '*.py' \
"#        -o -name '*.java' \
"#        -o -iname '*.[CH]' \
"#        -o -name '*.cpp' -o -name '*.cc' -o -name '*.hpp'  > cscope.files
"#
"#    # -b: just build
"#    # -q: create inverted index
"#    cscope -b -q
"#    ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -L cscope.files
"#
"#}}}"#-------------------------------------------------------------------------
"# win32 bat:
"#--------------------------------------------------------------------------#{{{
"#
"#    rm cscope.* tags
"#    set project=c:\work\foo
"#    find %project% -name "*.cpp" -o -name "*.[ch]" > cscope.files
"#    cscope -b -q
"#    ctags --extra=+q -L cscope.files
"#
"#-------------------------------------------------------------------------

"noremap <C-F8> :!cs<CR>

"if has("win32")
"    se csprg=D:\cscope\bin\cscope.exe"
"endif

"
"if has("cscope")
"
"    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
"    set cscopetag       " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
"    set csto=0          " check cscope for definition of a symbol before checking ctags: set to 1
"                        " if you want the reverse search order.
"    "set cscopeverbose  " show msg when any other cscope db added
"
"    " add any cscope database in current directory
"    if filereadable("./cscope.out")
"        cs add cscope.out
"    elseif filereadable("../cscope.out")
"        cs add ../cscope.out
"    elseif filereadable("../../cscope.out")
"        cs add ../../cscope.out
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
"
"
"    set cscopeverbose    " show msg when any other cscope db added
"
"
"    """"""""""""" My cscope/vim key mappings
"    "
"    " The following maps all invoke one of the following cscope search types:
"    "
"    "   's'   symbol: find all references to the token under cursor
"    "   'g'   global: find global definition(s) of the token under cursor
"    "   'c'   calls:  find all calls to the function name under cursor
"    "   't'   text:   find all instances of the text under cursor
"    "   'e'   egrep:  egrep search for the word under cursor
"    "   'f'   file:   open the filename under cursor
"    "   'i'   includes: find files that include the filename under cursor
"    "   'd'   called: find functions that function under cursor calls
"    "
"    " Below are three sets of the maps: one set that just jumps to your
"    " search result, one that splits the existing vim window horizontally and
"    " diplays your search result in the new window, and one that does the same
"    " thing, but does a vertical split instead (vim 6 only).
"    "
"    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
"    " unlikely that you need their default mappings (CTRL-\'s default use is
"    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
"    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
"    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
"    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
"    " (which also maps to CTRL-/, which is easier to type).  By default it is
"    " used to switch between Hebrew and English keyboard mode.
"    "
"    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
"    " that searches over '#include <time.h>" return only references to
"    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
"    " files that contain 'time.h' as part of their name).
"    "
"    " To do the first type of search, hit 'CTRL-\', followed by one of the
"    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
"    " search will be displayed in the current window.  You can use CTRL-T to
"    " go back to where you were before the search.
"    "
"
"    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
"
"    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
"    " makes the vim window split horizontally, with search result displayed in
"    " the new window.
"    "
"    " (Note: earlier versions of vim may not have the :scs command, but it
"    " can be simulated roughly via:
"    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>
"
"    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
"
"
"    " Hitting CTRL-space *twice* before the search type does a vertical
"    " split instead of a horizontal one (vim 6 and up only)
"    "
"    " (Note: you may wish to put a 'set splitright' in your .vimrc
"    " if you prefer the new window on the right instead of the left
"
"    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
"    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
"
"
"    "set notimeout          " By default Vim will only wait 1 second for each keystroke in a mapping.
"                            " You may find that too short with the above typemaps.  If so, you should
"                            " either turn off mapping timeouts via 'notimeout'.
"    "set timeoutlen=4000    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
"                            " with your own personal favorite value (in milliseconds):
"    "set ttimeout           " Either way, since mapping timeout settings by default also set the
"                            " timeouts for multicharacter 'keys codes' (like <F1>), you should also
"                            " set ttimeout and ttimeoutlen: otherwise, you will experience strange
"                            " delays as vim waits for a keystroke after you hit ESC (it will be
"                            " waiting to see if the ESC is actually part of a key code like <F1>).
"    "set ttimeoutlen=100    " personally, I find a tenth of a second to work well for key code
"                            " timeouts. If you experience problems and have a slow terminal or network
"                            " connection, set it higher.  If you don't set ttimeoutlen, the value for
"                            " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
"endif

"#}}}"#-------------------------------------------------------------------------
"# Command output in split
"#--------------------------------------------------------------------------#{{{

"funct! Exec(comand)
"    redir =>output
"    silent a:comand
"    redir END
"    return output
"endfunct!

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
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>
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

"nnoremap 0 <nop>
"nnoremap $ <nop>
"noremap <C-q> <nop>
"noremap <C-s> <nop>
"inoremap <esc> <nop>
"noremap tt <nop>
"nnoremap : <nop>
"nnoremap cp <nop>
"nnoremap BB <nop>

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
