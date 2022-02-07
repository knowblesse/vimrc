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
set number
set colorcolumn=100
set nowrap
set hlsearch
set relativenumber
set scrolloff=8
set scrolloff=8
set splitright
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
else
    nmap <leader>vv :e C:\VCF\vimrc\vimrc.vim <CR>
endif
"""""""""""""""""""""""""""""""""""
"           Color Scheme          "
"""""""""""""""""""""""""""""""""""
syntax on
colorscheme monokai
filetype on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""
"             Plugin              "
"""""""""""""""""""""""""""""""""""
"monokai theme is manually installed
"ctag is manually installed

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
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'

"Color theme
Plug 'joshdick/onedark.vim'

"Table generataion
Plug 'dhruvasagar/vim-table-mode'

"Vertical line generation
Plug 'Yggdroot/indentLine'

"Auto Commplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For Testing .....................

call plug#end()

"""""""""""""""""""""""""""""""""""
"       Start up Functions        "
"""""""""""""""""""""""""""""""""""
"autocmd VimEnter * call StartUp()
"function! StartUp()
"    if 0 == argc()
"        NERDTree
"    end
"endfunction
"
"""""""""""""""""""""""""""""""""""
"        Plugin Options           "
"""""""""""""""""""""""""""""""""""
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

"nerdtree
let g:nerdtree_open = 0
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

"""""""""""""""""""""""""""""""""""
"             Python              "
"""""""""""""""""""""""""""""""""""
"Python execute selected line script
autocmd FileType python setlocal completeopt-=preview
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

