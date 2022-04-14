nnoremap <leader>/ :<C-U>call commenter#ToggleComment(v:count1)<cr>
vnoremap <leader>/ :<C-U>call commenter#ToggleComment(line("'>") - line("'<")+1)<cr>
