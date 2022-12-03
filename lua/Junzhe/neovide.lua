vim.cmd([[
set guifont=MesloLGS\ NF:h15:b:#e-antialias:#h-full
let g:neovide_transparency = 0.0
let g:transparency = 0.8
let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

let g:neovide_refresh_rate = 60

let g:neovide_hide_mouse_when_typing = v:true

let g:neovide_cursor_antialiasing = v:true

let g:neovide_input_use_logo = v:true" v:true on macOS

let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
    let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><D-=> ChangeScaleFactor(1.25)
nnoremap <expr><D--> ChangeScaleFactor(1/1.25)

let g:neovide_remember_window_size = v:true
]])
