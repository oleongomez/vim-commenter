"Comment the current line in python

"Returns 1 if g:commenter#comment_string is defined
function! g:commenter#HasCommentStr()
  if exists('g:commenter#comment_string')
    return 1
  endif
  echom "vim-commenter does not work for ".&ft." file type yet."
  return 0
endfunction

"Returns the smallest indentation in a range of lines
function! g:commenter#GetMinumumIndent(start, end)
  let l:min_indent = indent(a:start)
  for i in range(a:start, a:end)
    let l:actual_indent = indent(i)
    if l:actual_indent < l:min_indent
      let l:min_indent = l:actual_indent
    endif
  endfor
  return l:min_indent
endfunction

"Checks if a string starts with a prefix
function! StartsWith(a_string, a_prefix)
  if a:a_string =~ a:a_prefix
      return 1
  else 
    return 0
  endif
endfunction
 
function! commenter#ToggleComment(count)
  if !g:commenter#HasCommentStr()
    return
  endif
  let l:start = line('.')
  let l:end = l:start + a:count - 1
  if l:end > line('$')
    let l:end = line('$')
  endif

  let l:min_indent = g:commenter#GetMinumumIndent(l:start, l:end)

  for i in range(l:start, l:end)
    let l:line = getline(i)
    let l:is_commented = StartsWith(l:line, g:commenter#comment_string)
    if l:is_commented == 1
      let l:tmp = substitute(l:line, g:commenter#comment_string.' ', '', 1)
      call setline(i ,l:tmp)
    else    
      if l:min_indent - 1 > 0
        call setline(i, l:line[:l:min_indent - 1].g:commenter#comment_string.' '.l:line[l:min_indent:])
      else
        call setline(i, g:commenter#comment_string.' '.l:line[l:min_indent:])
      endif
    endif
  endfor
endfunction
