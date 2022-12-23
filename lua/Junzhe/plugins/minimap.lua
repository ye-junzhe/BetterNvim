vim.cmd([[
let g:minimap_width = 10
" let g:minimap_auto_start = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_range = 1

" yellow for git modified
" purple for current
hi Yellow1 ctermfg=226 guifg=#ffff00 " Yellow1: No.226
hi Purple4 ctermfg=55  guibg=#5f00af " Purple4: No.55 
hi Purple3 ctermfg=56  guifg=#5f00d7 " Purple3: No.56 
hi Blue3   ctermfg=20  guibg=#0000d7 
let g:minimap_cursor_color = 'Purple4'
let g:minimap_diff_color = 'Yellow1'
let g:minimap_range_color = 'Purple3'
let g:minimap_range_diff_color = 'Yellow1'
let g:minimap_search_color = 'Blue3'
]])
