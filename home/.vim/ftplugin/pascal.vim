setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
compiler fpc
set makeprg=fpc\ -vb\ -g\ %
map <F9> :w<CR>:make<CR>
