" quick replace occurences
let g:should_inject_replace_occurences = 0
function! MoveToNext()
    if g:should_inject_replace_occurences
        call feedkeys("n")
        call repeat#set("\<Plug>ReplaceOccurences")
    endif

    let g:should_inject_replace_occurences = 0
endfunction

augroup auto_move_to_next
    autocmd! InsertLeave * :call MoveToNext()
augroup END

nmap <silent> <Plug>ReplaceOccurences :call ReplaceOccurence()<CR>
nmap <silent> <Leader>r :let @/ = '\C\<'.expand('<cword>').'\>'<CR>
    \:set hlsearch<CR>:let g:should_inject_replace_occurences=1<CR>cgn
vmap <silent> <Leader>r :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy:let @/ = substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>:set hlsearch<CR>:let g:should_inject_replace_occurences=1<CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>cgn

function! ReplaceOccurence()
    " check if we are on top of an occurence
    let l:winview = winsaveview()
    let l:save_reg = getreg('"')
    let l:save_regmode = getregtype('"')
    let [l:lnum_cur, l:col_cur] = getpos(".")[1:2] 
    normal! ygn
    let [l:lnum1, l:col1] = getpos("'[")[1:2]
    let [l:lnum2, l:col2] = getpos("']")[1:2]
    call setreg('"', l:save_reg, l:save_regmode)
    call winrestview(winview)
    
    " if we are on top of an occurence, replace it
    if l:lnum_cur >= l:lnum1 && l:lnum_cur <= l:lnum2 && l:col_cur >= l:col1 && l:col_cur <= l:col2
        exe "normal! cgn\<c-a>\<esc>"
    endif
    
    call feedkeys("n")
    call repeat#set("\<Plug>ReplaceOccurences")
endfunction