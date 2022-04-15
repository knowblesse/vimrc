" vim runtime config file
" Written by Knowblesse 2020
" Adapted from miguelgrinberg/.vimrc

"""""""""""""""""""""""""""""""""""
"             Basics              "
"""""""""""""""""""""""""""""""""""
" Sane text files
set fileformat=unix " uses line ending LF (not DOS-style CR LF)
set encoding=utf-8
set fileencoding=utf-8
" View
set colorcolumn=100
set number
set nowrap
set hlsearch
set relativenumber
set scrolloff=8
set scrolloff=8
set splitright
set equalalways
set foldmethod=indent
" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Font
if has('unix')
    echo "Unix Mode"
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
else
    echo "Window Mode"
    set guifont=Bitstream\ Vera\ Sans\ Mono:h12
endif
" Test
set spell
set incsearch " Start searching while typing

"""""""""""""""""""""""""""""""""""
"             Plugin              "
"""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'yegappan/taglist'
Plug 'tpope/vim-sensible'
Plug 'mg979/vim-visual-multi'

"buffer lists instead of tab
Plug 'ap/vim-buftabline'

"NERD
Plug 'preservim/nerdtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

"Coding
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'

"Color theme
Plug 'joshdick/onedark.vim'
Plug 'patstockwell/vim-monokai-tasty'

"Table generataion
Plug 'dhruvasagar/vim-table-mode'

"Vertical line generation
Plug 'Yggdroot/indentLine'

"Auto Commplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""""""""
"          Key Bindings           "
"""""""""""""""""""""""""""""""""""
imap jk <Esc>
nmap <Tab> >>
nmap <S-tab> <<
vmap < <gv
vmap > >gv
map <leader>t :call NERDTreeToggle()<CR>

"remove highlighted
nmap <leader>] : nohlsearch<CR> 

"delete buffer w/o closing the current window
nmap <leader>q :bp\|bd #<CR>

"faster editting
if has('unix')
    nmap <leader>vv :e ~/VCF/vimrc/vimrc.vim <CR>
    nmap <leader>vvv :e! ~/VCF/vimrc/vimrc.vim <CR>
else
    nmap <leader>vv :e C:\VCF\vimrc\vimrc.vim <CR>
    nmap <leader>vvv :e! C:\VCF\vimrc\vimrc.vim <CR>
endif

"tab complete
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col -1] =~ '\s'
endfunction
imap <silent><expr> <tab> 
    \ pumvisible() ? "\<C-n>" : 
    \ <SID>check_back_space() ? "\<Tab>" : 
    \ coc#refresh()
imap <silent><expr> <S-tab> 
    \ pumvisible() ? "\<C-p>" : 
    \ <SID>check_back_space() ? "\<Tab>" : 
    \ coc#refresh()
"""""""""""""""""""""""""""""""""""
"           Color Scheme          "
"""""""""""""""""""""""""""""""""""
syntax on
colorscheme vim-monokai-tasty
filetype on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""
"        Plugin Options           "
"""""""""""""""""""""""""""""""""""
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

"nerdtree
let g:nerdtree_open = 1
function NERDTreeToggle()
    NERDTreeToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
        NERDTreeFind
    endif
endfunction

" vim-table-mode
let g:table_mode_corner_corner = '+'

" disable coc warning
let g:coc_disable_startup_warning = 1

""""""""""""""""""""""""""""""""""""
""             Python              "
""""""""""""""""""""""""""""""""""""
""Python execute selected line script
"autocmd FileType python setlocal completeopt-=preview
"python3 << EOL
"import vim
"
"def ExecuteSelectedLine(l1, l2):
"    for i in range(l1-1,l2):
"        print(">>" + vim.current.buffer[i])
"        exec(vim.current.buffer[i],globals())
"def ExecuteExpression(exp):
"    print(">>" + exp)
"    exec(exp,globals())
"EOL
"command! -range Ev <line1>,<line2> python3 ExecuteSelectedLine(<line1>, <line2>)

