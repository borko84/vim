let b:comment_leader = '//'
set foldmethod=syntax

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



"#}}}"#-------------------------------------------------------------------------
"# Compile and run C++
"#-------------------------------------------------------------------------"#{{{
noremap <F9>    :call CompileRunGpp()<CR>
noremap <S-F9>  :call Cgdb()<CR>
noremap <C-F10> :call MakeClean()<CR>
noremap <F11>   :call Run()<CR>

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
