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

cd .
colorscheme wombat256

if has("win32")                     "system
    set t_Co=256
    winpos 50 80
    set lines=50 columns=140
    set guifont=Courier\ New:h9
    set enc=utf-8                       " needed for win
else
    runtime! debian.vim
    set guifont=Liberation\ Mono\ 9
endif


if has("gui_running")               "GUI
    set guioptions=a
else
    set t_Co=256
endif

"#}}}#---------------------------------------------------------------------------
"#    pathogen
"#---------------------------------------------------------------------------#{{{
"#   Submodule add 
"#       > git rm -r .vim/bundle/fugitive        
"#       > git submodule add git://github.com/tpope/vim-fugitive.git .vim/bundle/fugitive
"#   Register :
"#       > git submodule init        
"#       > git submodule update
"#   Remove submodule:
"#       remove references in .gitmodules 
"#                            .git/config.
"#       > git rm --cached .vim/bundle/fugitive
"#--------------------------------------------------------------------------------
call pathogen#infect() 
call pathogen#helptags()



if has("syntax")
      syntax on
endif

if has("autocmd")                   "indentation rules and plugins(filetype)
  filetype plugin indent on
endif

if has("autocmd")                   "jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
endif





"#}}}"#-------------------------------------------------------------------------
"# Text Edition Settings
"#--------------------------------------------------------------------------#{{{

"set verbose=1           " see everything vim is doing

set backspace=indent,eol,start
set expandtab           " spaces instead of tab
set gcr=a:blinkwait0    " non blinking cursor
set hidden              " Hide buffers when they are abandoned
set history=1000        " remember more commands and search history
set undolevels=1000     " use many muchos levels of undo
set virtualedit=all     " let the cursor stray beyond the defined text.
set hls                 " set highlighting
set ic                  " ignorecase (Case insensitive search)
set incsearch           " Incremental search - "b" = go to the first "b" ; type "o," go to "bo".
set laststatus=2        " Always display a statusline
set mouse=a             " Enable mouse usage (all modes)
set nocompatible        " Use Vim settings
set number              " Line Numbering
set showbreak=~         " Show break char
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set softtabstop=4
set tabstop=4           " 4-space tabs
set vb t_vb=            " Flash instead of beep
set shiftwidth=4        " 4 spaces when text is indented
set wrap
set listchars=tab:>.,trail:.,extends:#,nbsp:. ",eol:$

if version >= 703
    set colorcolumn=81
endif


set scrolljump=7
set sidescroll=5        "when moving in the file horizontally move 5 columns a time
set listchars+=precedes:~,extends:~ " nice indicators that there is more text horizontally
"set showbreak=>        " Show break char
set wildmode=longest:full
set wildmenu


"#}}}"#-------------------------------------------------------------------------
"# Statusline
"#--------------------------------------------------------------------------#{{{
"set statusline=%<[%02n]\ %F%(\ %m%h%w%y\ %{&ff}\ %r%)\ %a%=\ %{strftime(\"%H:%M\")}\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
"set statusline=%<%F%h%m%r%h%w\ \-\ %y\[%{&ff}\]\ \-\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\/%L\ col:%c/%V\ pos:%o\ ascii:%b\ %P
"set statusline=%f%m%r%h\ [%b]\ [%{&ff}]\ %y%=[%p%%]\ [%05lx%02v]
set statusline=[%n]
set statusline+=\ %f%m%r%h
"set statusline+=[lines:%L]\
set statusline+=\ [%p%%]
set statusline+=\ %y%=%{strftime(\"%d\.%m\.\ %H:%M\",getftime(expand(\"%:p\")))}
"set statusline+=[%{&ff}]\
set statusline+=\ [%05lx%02v]



"#}}}"#-------------------------------------------------------------------------
"# tab label
"#--------------------------------------------------------------------------#{{{

" crashes after 25 tabs opened
"--------------------------------
"function MyTabLine()
"    let s = ''
"    let t = tabpagenr()
"    let i = 1
"    while i <= tabpagenr('$')
"        let buflist = tabpagebuflist(i)
"        let winnr = tabpagewinnr(i)
"        let s .= '%' . i . 'T'
"        let s .= (i == t ? '%1*' : '%2*')
"        "let s .= ' ' . i . ' '
"        let s .= '%*'
"        let s .= ' '
"        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"        let file = bufname(buflist[winnr - 1])
"        let file = fnamemodify(file, ' :p:t ')
"        if file == ''
"            let file = ' [No Name] '
"        endif
"         "name trunc
"        if strlen(file) >= 10
"             let file = file[0:10]
"        endif
"        let s .= file
"        let i = i + 1
"    endwhile
"    let s .= '%T%#TabLineFill#%='
"    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"    return s
"endfunction
"set tabline=%!MyTabLine()

" TODO
"--------------------------------
"function MyTabLine()
"  let s = ''
"  for i in range(tabpagenr('$'))
"    " select the highlighting
"    if i + 1 == tabpagenr()
"      let s .= '%#TabLineSel#'
"    else
"      let s .= '%#TabLine#'
"    endif
"
"    " set the tab page number (for mouse clicks)
"    let s .= '%' . (i + 1) . 'T'
"
"    " the label is made by MyTabLabel()
"    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"  endfor
"
"  " after the last tab fill with TabLineFill and reset tab page nr
"  let s .= '%#TabLineFill#%T'
"
"  " right-align the label to close the current tab page
"  if tabpagenr('$') > 1
"    let s .= '%=%#TabLine#%999Xclose'
"  endif
"
"  return s
"endfunction



"#}}}"#-------------------------------------------------------------------------
"#  key mapping
"#--------------------------------------------------------------------------#{{{
nnoremap ; :

"tabs
"map <C-h> gT
"map <C-l> gt
:map <A-1> :tabn 1<CR>
:map <A-2> :tabn 2<CR>
:map <A-3> :tabn 3<CR>
:map <A-4> :tabn 4<CR>
:map <A-5> :tabn 5<CR>
:map <A-6> :tabn 6<CR>
:map <A-7> :tabn 7<CR>
:map <A-8> :tabn 8<CR>
:map <A-9> :tabn 9<CR>

nmap <C-t> :tabnew <CR>
vmap <C-c> "+y
map <C-s> :!echo "NO NO NO"<CR>
map <C-q> :quit <CR>
map <C-a> ggVG

noremap J 30j
noremap K 30k

vnoremap < <gv
vnoremap > >gv

nmap <silent> <f5>:!# <CR>
map <xCSI>[62~ <MouseDown>


"closing braces
inoremap (<Tab>  ()<Left>
inoremap {<Tab>  {}<Left>
inoremap "<Tab>  ""<Left>
inoremap '<Tab>  ''<Left>
inoremap [<Tab>  []<Left>


map <C-k> <Esc><C-w><C-w>

"nnoremap n nzzzv            " Keep search matches in the middle of the window.
"nnoremap N Nzzzv
"nnoremap g; g;zz            " same when jumping to changes!
"nnoremap g, g,zz



"#}}}"#-------------------------------------------------------------------------
"# sed & regexp
"#--------------------------------------------------------------------------#{{{
"
"    \d    digit                   [0-9]
"    \D    non-digit               [^0-9]
"    \x    hex digit               [0-9a-fA-F]
"    \X    non-hex digit           [^0-9a-fA-F]
"    \s    white space             [    ]     (<Tab> and <Space>)
"    \S    non-white characters    [^     ]     (not <Tab> and <Space>)
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
cmap ;w \(\w\+\)
cmap ;s \(\s\+\)
cmap ;d \(\d\+\)
cmap ;. \(.*\)

cmap ;n \(\n\+\)
cmap ;' \(\)<Left><Left>
cmap ;< \<\><Left><Left>
cmap ;x <\>\(.*\)\</<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>



"#}}}"#-------------------------------------------------------------------------
"# clearing function
"#--------------------------------------------------------------------------#{{{
func! Cls()
    exec ':%s/\(\s\+\)$//gc'
    exec ':%s/\t/    /gc'
    exec ':%s/\r//gc'
endfunc
nmap cls :call Cls()<CR>


"#}}}"#-------------------------------------------------------------------------
"# comment
"#--------------------------------------------------------------------------#{{{
let b:comment_leader = '#'
au FileType c,cpp,java              let b:comment_leader = '//'
au FileType sh,ruby,python,awk,perl let b:comment_leader = '#'
au FileType conf,fstab,make         let b:comment_leader = '#'
au FileType tex                     let b:comment_leader = '%'
au FileType mail                    let b:comment_leader = '>'
au FileType vim                     let b:comment_leader = '"'
au FileType sql                     let b:comment_leader = '--'

"vnoremap <silent> / <C-v>Ib:comment_leader<Esc><Esc>
vnoremap / :s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
vnoremap ? :s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>





"#}}}"#-------------------------------------------------------------------------
"# NERDTree
"#--------------------------------------------------------------------------#{{{
"autocmd BufNewFile * NERDTreeMirror
let NERDTreeWinPos = "right"
nmap <silent> <C-e> <Esc>:NERDTreeToggle . <CR> <C-w> l
"autocmd VimEnter * NERDTree

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
autocmd WinEnter * call NERDTreeQuit()



"#}}}"#-------------------------------------------------------------------------
"# Gundo
"#--------------------------------------------------------------------------#{{{
if version >= 703
    nnoremap <F6> :GundoToggle<CR>
endif


"#}}}"#-------------------------------------------------------------------------
"# autoclose
"#--------------------------------------------------------------------------#{{{
au VimEnter * AutoCloseOff
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
"let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]


"#}}}"#-------------------------------------------------------------------------
"# Compile and run C++
"#-------------------------------------------------------------------------"#{{{
"# cd %:p:h
"#------------------------------------------------------------------------------
map <F2>    :call SaveSession()<CR>
map <F3>    :call LoadSession()<CR>

map <F9>    :call CompileRunGpp()<CR>
map <F10>   :call Make()<CR>
map <C-F10> :call MakeClean()<CR>
map <F11>   :call Run()<CR>
map <F12>   :call Synchronize()<CR>

func! Synchronize()
  exec "w"
  exec "!bash /home/sg0216005/scripts/rsync.sh"
endfunc

func! LoadSession()
    exec ":so ~/session.vim"
endfunc

func! SaveSession()
    exec ":mks! ~/session.vim"
endfunc

func! CompileRunGpp()
  "Save the file 
  exec "w" 
  exec "!cd %:p:h && g++ % -o %< && IF EXIST %<.exe (%<) ELSE banner -c = Compile Unsuccessful "
  "exec "!g++ % -o %< && cr 10 && IF EXIST %<.exe (%<) ELSE banner -c = Compile Unsuccessful "
  "jump back where we were
  exec "i"  
endfunc

func! Make()
  exec "w"
  exec "!cd %:p:h && cd.. && make all"
  "exec "! %:p:h/../bin/network.exe"
endfunc

func! MakeClean()
  exec "w"
  exec "!cd %:p:h && cd .. && make clean && make"
  "return ":silent \<CR>"
endfunc

func! Run()
  exec "w"
  exec "!cd %:p:h && cd .. && run"
endfunc



"# exec "!g++ % -o %< && IF EXIST %<.exe (cr 5 && banner -c # Success) ELSE banner -c # Compile Unsuccessful "
"# exec "!gcc -Wall -g % -o %<"

au FileType python map <F9> :w<CR>:!python3 %<CR>
au FileType python map <C-F9> :w<CR>:!python %<CR>

au FileType perl map <F9> :w<CR>:!perl -w %<CR>
au FileType perl map <C-F9> :w<CR>:!perl -wc %<CR>



"#}}}"#-------------------------------------------------------------------------
"# Doxygen
"#--------------------------------------------------------------------------#{{{
let g:load_doxygen_syntax=1
"map <F2> :Dox<CR>

"#}}}"#-------------------------------------------------------------------------
"# switch between header/source with F4
"#--------------------------------------------------------------------------#{{{
map <C-h> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"map <C-h> :e %:p:s,.h$,.X123X,:s,.cxx$,.h,:s,.X123X$,.cxx,<CR>



"#}}}"#-------------------------------------------------------------------------
"# Folding
"#--------------------------------------------------------------------------#{{{
set foldlevelstart=20
set foldnestmax=1

"map <C-m> <Esc>zM

let g:folding_flag = 0
function! FoldingToggle()
    if g:folding_flag
         execute 'normal zR'
        let g:folding_flag = 0
    else
        execute 'normal zM'
        let g:folding_flag = 1
    endif
endfunction
nmap zm :call FoldingToggle()<CR>



set foldmethod=syntax
au FileType sh,ksh,awk,vim,make,conf,txt,snippet :set foldmethod=marker
au FileType python  :set foldmethod=indent
"au BufNewFile,BufRead *.cpp exec 'normal zM'


"#}}}"#=========================================================================
"#                              C++ setttings
"#==========================================================================#{{{


"#}}}"#-------------------------------------------------------------------------
"# path
"#--------------------------------------------------------------------------#{{{
set autochdir           " path = path of the edited file

" HOME :
"set path+=~/workspace/cpp/Network/**
"set path+=~/usr/include/**

" WORK :
"set path+=C:/MinGW/include/**
"set path+=C:/MinGW/lib/gcc/mingw32/4.5.0/include/**
"set path+=C:/projekty/acm/out/include/**            " boost + ua



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

set tags=tags,.\tags,tags;/
"set tags+=~\vimfiles\tags\std_tags
"set tags+=~\vimfiles\tags\cpp_tags
"set tags+=C:\unicard\src\platinum\3_utils\UniSynchro\tags
"set tags+=C:\unicard\src\platinum\komp\tags


set tags+=..\..\tags
set tags+=C:/MinGW/lib/gcc/mingw32/4.5.0/include/tags   " std
set tags+=C:\unicard\src\platinum\tags                  " KD/RCP
set tags+=C:\unicard\src\platinum\uaCoreRcp\tags        " KD/RCP
set tags+=C:\projekty\acm\out\include\ua\tags           " acManager
set tags+=C:\projekty\dbapi\hdr\release\tags            " core


map <F8> :!cd %:p:h && ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


autocmd FileType python     map <F8> :!/usr/bin/ctags -R --c++-kinds=+p .<CR> 
autocmd FileType python     set tags+=/.vim/tags/python26.ctags



"#}}}"#-------------------------------------------------------------------------
"# TagList
"#--------------------------------------------------------------------------#{{{
"let Tlist_Ctags_Cmd = "ctags"
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 35
"let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Use_SingleClick = 1
"let Tlist_Show_One_File = 1       " Only show tags for current buffer
"let TlistHighlightTag = 1
"let Tlist_Highlight_Tag_On_BufEnter = 1
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Show_Menu = 1
"
"let s:tlist_def_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' .
"                             \ 'c:class;g:enum;s:struct;u:union;f:function;m:member;' .
"                             \ 'p:prototype'
"let Tlist_Auto_Open = 1
"let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
"let tlist_cpp_settings = ‘c:class;f:function’
"map <S-F4> :TlistToggle<CR>

let g:tagbar_sort = 0
let g:tagbar_compact  = 1

map <S-F4> :TlistToggle<CR>
map <F4> :TagbarToggle<CR>




"#}}}"#-------------------------------------------------------------------------
"# omnicomplete
"#--------------------------------------------------------------------------#{{{
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
"set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin


"#}}}"#-------------------------------------------------------------------------
"# omnicomplete - cpp
"#--------------------------------------------------------------------------#{{{
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_ShowAccess          = 1 " show access in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 " show prototype in pop-up
let OmniCpp_ShowScopeInAbbr     = 0 " do not show namespace in pop-up
let OmniCpp_SelectFirstItem     = 1 " select first item in pop-up
let OmniCpp_MayCompleteDot      = 1 " auto .
let OmniCpp_MayCompleteArrow    = 1 " auto ->
let OmniCpp_MayCompleteScope    = 1 " auto ::

let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"auto open/close popup menu
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest  ",preview  "for scratch window

imap <C-o> <C-x><C-o>
imap <C-space> <C-o>
imap <S-space> <C-x><C-o>
imap <C-n> <C-x><C-n>
inoremap <expr> <space> ((pumvisible())?("\<Down>"):("<space>"))


"#}}}"#=========================================================================
"#                         PYTHON setttings
"#==========================================================================#{{{

"#}}}"#-------------------------------------------------------------------------
"# omnicomplete - python
"#--------------------------------------------------------------------------#{{{
let g:pydiction_location = 'usr/share/vim/vim72/ftplugin/pydiction/complete-dict'

" <silent> py !python %
au FileType python setlocal columns=100
au FileType python set completeopt=menuone,menu,longest,preview


"" go to defn of tag under the cursor
"fun! MatchCaseTag()
"    let ic = &ic
"    set noic
"    try
"        exe 'tjump ' . expand('')
"    finally
"       let &ic = ic
"    endtry
"endfun
"nnoremap <silent> :call MatchCaseTag()<CR>


" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim

#sys.path.append("/usr/lib/python3.1/") 
#sys.path.append("/usr/lib/python3.1") 
#sys.path.append("/usr/lib/python3.1/plat-linux2") 
#sys.path.append("/usr/lib/python3.1/lib-dynload") 
#sys.path.append("/usr/lib/python3.1/dist-packages") 
#sys.path.append("/usr/local/lib/python3.1/dist-packages")


for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF



"#}}}"#-------------------------------------------------------------------------
"# Hlsearch
"#--------------------------------------------------------------------------#{{{
set hlsearch
noremap <C-p> :set hlsearch! hlsearch? <CR>


"#}}}"#-------------------------------------------------------------------------
"#  CtrlP
"#--------------------------------------------------------------------------#{{{
let g:ctrlp_map = '<C-f>'
let g:ctrlp_use_caching = 1     " <F5> while inside |CtrlP| will purge the cache
let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.metadata\|\.git\|\.project\|\.cproject'

func! CP()
    exec ':CtrlP'
endfunc          


"#}}}"#-------------------------------------------------------------------------
"# ifndef regions
"#--------------------------------------------------------------------------#{{{
"#
"#  syn region MySkip contained start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*#\s*endif\>" contains=MySkip
"#
"#  let g:CommentDefines = ""
"#
"#  hi link MyCommentOut2 MyCommentOut
"#  hi link MySkip MyCommentOut
"#  hi link MyCommentOut Comment
"#
"#  map <silent> ,a :call AddCommentDefine()<CR>
"#  map <silent> ,x :call ClearCommentDefine()<CR>
"#
"#  function! AddCommentDefine()
"#    let g:CommentDefines = "\\(" . expand("<cword>") . "\\)"
"#    syn clear MyCommentOut
"#    syn clear MyCommentOut2
"#    exec 'syn region MyCommentOut start="^\s*#\s*ifdef\s\+' . g:CommentDefines . '\>" end=".\|$" contains=MyCommentOut2'
"#    exec 'syn region MyCommentOut2 contained start="' . g:CommentDefines . '" end="^\s*#\s*\(endif\>\|else\>\|elif\>\)" contains=MySkip'
"#  endfunction
"#
"#  function! ClearCommentDefine()
"#    let g:ClearCommentDefine = ""
"#    syn clear MyCommentOut
"#    syn clear MyCommentOut2
"#  endfunction
"#-------------------------------------------------------------------------
hi link IfdefReg IfdefColor

function! ColorDefine()
    exec 'syn region IfdefReg start="^\s*#ifdef" end="^\s*#endif\(.*\)$"'
endfunction
function! UncolorDefine()
    syn clear IfdefReg
endfunction

let g:ifdef_highlight = 0
function! IfdefToggle()
    if g:ifdef_highlight
        call UncolorDefine()
        let g:ifdef_highlight = 0
    else
        call ColorDefine()
        let g:ifdef_highlight = 1
    endif
endfunction

au FileType c,cpp call IfdefToggle()
nnoremap ,t :call IfdefToggle()<CR>


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
set grepprg=grep\ -nH\ $*   " IMPORTANT: grep will sometimes skip displaying the file name if you
                            "   search in a singe file. This will confuse Latex-Suite. Set your grep
                            "   program to always generate a file-name
filetype indent on          " OPTIONAL: This enables automatic indentation as you type
let g:tex_flavor='latex'    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
                            "   'plaintex' instead of 'tex', which results in vim-latex not being loaded.
                            "   The following changes the default filetype back to 'tex':
"set sw=2                   "   this is mostly a matter of taste. but LaTeX looks good with just a bit
                            "   of indentation.
set iskeyword+=:            " TIP: if you write your \label's as \label{fig:something}, then if you
                            "   type in \ref{fig: and press <C-n> you will automatically cycle through
                            "   all the figure labels. Very useful!

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

map <C-F8> :!cs<CR>

"if has("win32")
"    se csprg=D:\cscope\bin\cscope.exe"
"endif


if has("cscope")

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag       " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set csto=0          " check cscope for definition of a symbol before checking ctags: set to 1
                        " if you want the reverse search order.
    "set cscopeverbose  " show msg when any other cscope db added

    " add any cscope database in current directory
    if filereadable("./cscope.out")
        cs add cscope.out
    elseif filereadable("../cscope.out")
        cs add ../cscope.out
    elseif filereadable("../../cscope.out")
        cs add ../../cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif


    set cscopeverbose    " show msg when any other cscope db added


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).
    "
    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    "set notimeout          " By default Vim will only wait 1 second for each keystroke in a mapping.
                            " You may find that too short with the above typemaps.  If so, you should
                            " either turn off mapping timeouts via 'notimeout'.
    "set timeoutlen=4000    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
                            " with your own personal favorite value (in milliseconds):
    "set ttimeout           " Either way, since mapping timeout settings by default also set the
                            " timeouts for multicharacter 'keys codes' (like <F1>), you should also
                            " set ttimeout and ttimeoutlen: otherwise, you will experience strange
                            " delays as vim waits for a keystroke after you hit ESC (it will be
                            " waiting to see if the ESC is actually part of a key code like <F1>).
    "set ttimeoutlen=100    " personally, I find a tenth of a second to work well for key code
                            " timeouts. If you experience problems and have a slow terminal or network
                            " connection, set it higher.  If you don't set ttimeoutlen, the value for
                            " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.

endif

"#}}}"#-------------------------------------------------------------------------
"# cmdResult() - show output in other tab
"#--------------------------------------------------------------------------#{{{
"function! CmdResult(cmd)
"  redir => message
"  silent execute a:cmd
"  redir END
"  new
"  silent put=message
"  set nomodified
"endfunction
"command! -nargs=+ -complete=command CmdResult call CmdResult(<q-args>)


"#}}}"#-------------------------------------------------------------------------
"# VimDiff2 -showChanges() in new tab
"#--------------------------------------------------------------------------#{{{
" function! s:ShowDiff()
"     let tmpa = tempname()
"     let tmpb = tempname()
"     earlier 100h
"     exec 'w '.tmpa
"     later 100h
"     exec 'w '.tmpb
"     update
"     exec 'tabnew '.tmpa
"     exec 'NerdTreeClose'
"     diffthis
"     vert split
"     exec 'edit '.tmpb
"     diffthis
" endfunction


function! s:ShowDiff()
     exec 'NerdTreeClose'
     exec 'bp'
     diffthis
     exec 'vs'
     exec 'bp'
     "exec 'bp'
     diffthis
 endfunction
command! -nargs=0 DF call <SID>ShowDiff()


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
"# Buffer select
"#--------------------------------------------------------------------------#{{{
"
"function! BufSel(pattern)
"  let bufcount = bufnr("$")
"  let currbufnr = 1
"  let nummatches = 0
"  let firstmatchingbufnr = 0
"  while currbufnr <= bufcount
"    if(bufexists(currbufnr))
"      let currbufname = bufname(currbufnr)
"      if(match(currbufname, a:pattern) > -1)
"        echo currbufnr . ": ". bufname(currbufnr)
"        let nummatches += 1
"        let firstmatchingbufnr = currbufnr
"      endif
"    endif
"    let currbufnr = currbufnr + 1
"  endwhile
"  if(nummatches == 1)
"    execute ":buffer ". firstmatchingbufnr
"  elseif(nummatches > 1)
"    let desiredbufnr = input("Enter buffer number: ")
"    if(strlen(desiredbufnr) != 0)
"      execute ":buffer ". desiredbufnr
"    endif
"  else
"    echo "No matching buffers"
"  endif
"endfunction
"
""Bind the BufSel() function to a user-command
"command! -nargs=1 Bs :call BufSel("<args>")


"#}}}"#-------------------------------------------------------------------------
"# VimDiff
"#--------------------------------------------------------------------------#{{{
noremap <space> ]cz.
noremap <S-space> [cz.

if &diff
    set t_Co=256
    set nowrap
    set diffopt=filler
    set foldminlines=99999
    colorscheme wombat256

    if has("gui_running")
        exec "winpos 50 50"
        exec "set lines=70"
        exec "set columns=160"
    endif


    "mappings
    noremap dt :diffthis<CR> gg ]cz.
    noremap du :diffupdate<CR>

    "double win
    "exec ":vs"
    "exec "vertical resize 80"
endif



"#}}}"#-------------------------------------------------------------------------
"# FuzzyFinder
"#--------------------------------------------------------------------------#{{{
map <C-f> :FufRenewCache<CR>:FufFile<CR>


"#}}}"#-------------------------------------------------------------------------
"# BufExplorer
"#--------------------------------------------------------------------------#{{{
"#Sort by:
"#   'extension', 'fullpath', 'mru' (recently used), 'name, 'number'
"#-------------------------------------------------------------------------
let g:bufExplorerSortBy='name'
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerSplitBelow = 0
"let g:bufExplorerSplitHorzSize = 7
"let g:bufExplorerOpenMode = 1

map <C-b> :BufExplorer<CR>
map <C-S-b> <C-t>:BufExplorer<CR>


"#}}}"#-------------------------------------------------------------------------
"# vimgrep
"#--------------------------------------------------------------------------#{{{
function! Grepc(pat,path,ext)
    let s:pat =a:pat
    let s:path=a:path
    let s:ext =a:ext

    if s:ext==""
        let s:ext="*"
    endif
    if s:path==""
        let s:path="."
    endif
    if s:pat!=""
        execute("vimgrep /".s:pat."/gj ".s:path."/**/*.".s:ext)
        cwindow
        execute ":wincmd J"
    endif
endfunction

noremap <C-g><Esc> :call Grepc("",'.','cpp')<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
au FileType python noremap <C-g><Esc> :call Grepc("",'.','py')<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
map <C-g><C-g><Esc> :vimgrep // ./**/*.cpp<left><left><left><left><left><left><left><left><left><left><left><left>
"vnoremap <silent> gv :call VisualSearch('gv')<CR>   " When you press gv you vimgrep after the selected text


"#}}}"#-------------------------------------------------------------------------
"# Abbreviations
"#--------------------------------------------------------------------------#{{{

"iabbr if( if( )<CR>{<esc>7hi


