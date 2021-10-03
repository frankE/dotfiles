call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Badacadabra/vim-archery'
Plug 'arcticicestudio/nord-vim'
"Plug 'nightsense/snow'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'lervag/vimtex'
call plug#end()

let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" vim-lsp
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" rls
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif


" Asyncomplete
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

" Files via asynccomplete-file
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

imap <c-n> <Plug>(asyncomplete_force_refresh)
set completeopt+=preview
" Auto close preview window
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:rustfmt_emit_files = 1


let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters = {'rust': ['rls'], 'python': ['pyls']}
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
colorscheme nord
