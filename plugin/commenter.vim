nnoremap <leader>/ :<C-U>call commenter#ToggleComment(v:count1)<cr>
vnoremap <leader>/ :<C-U>call commenter#ToggleComment(line("'>") - line("'<")+1)<cr>
nnoremap _x :<C-U>echo "the count is " .. v:count1<CR>
vnoremap _x :<C-U>echo "the count is " .. v:count<CR>
