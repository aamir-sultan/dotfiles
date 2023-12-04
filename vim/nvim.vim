" NeoVim Settings
  function g:CloseBufOrWin() abort
    let l:bufs = nvim_list_bufs()
    let l:activebufs = []
    for l:buf in bufs
      if nvim_buf_is_loaded(l:buf) && nvim_buf_is_valid(l:buf)
        call add(l:activebufs, l:buf)
      endif
    endfor
  
    " if len(l:activebufs) > 1
    if len(getbufinfo({'buflisted':1})) > 1
      execute 'bd'
    else
      execute 'q'
    endif
  endfunction
  
  nnoremap <Leader>q <Cmd>call CloseBufOrWin()<CR>
  
  " set term=screen-256color
  " if exists('+termguicolors')
  "   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "   set termguicolors
  " endif  