" vim runtime config file
" Written by Knowblesse 2020
" Adapted from miguelgrinberg/.vimrc

"""""""""""""""""""""""""""""""""""
"             Basics              "
"""""""""""""""""""""""""""""""""""
" sane text files
set fileformat=unix " uses line ending LF (not DOS-style CR LF)
set encoding=utf-8
set fileencoding=utf-8
set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=100
set expandtab
set hlsearch
set guifont=Bitstream\ Vera\ Sans\ Mono:h12

" Key Bindings
imap jk <Esc>
nmap <Tab> >>
nmap <S-tab> <<


" color scheme
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

"buffer lists instead of tab
Plug 'ap/vim-buftabline'

"NERD
Plug 'preservim/nerdtree'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Coding
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'

"Color theme
Plug 'joshdick/onedark.vim'

"Table generataion
Plug 'dhruvasagar/vim-table-mode'

call plug#end()


"""""""""""""""""""""""""""""""""""
"       Start up Functions        "
"""""""""""""""""""""""""""""""""""
autocmd VimEnter * call StartUp()
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

"""""""""""""""""""""""""""""""""""
"        Plugin Options           "
"""""""""""""""""""""""""""""""""""
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

"nerdtree
let g:nerdtree_open = 0
map <leader>t :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

"""""""""""""""""""""""""""""""""""
"             Python              "
"""""""""""""""""""""""""""""""""""
"set pythonthreehome=~\Anaconda3\
"set pythonthreedll=~\Anaconda3\python37.dll
"Python execute selected line script
autocmd FileType python setlocal completeopt-=preview
python3 << EOL
import vim

def ExecuteSelectedLine(l1, l2):
    for i in range(l1-1,l2):
        print(">>" + vim.current.buffer[i])
        exec(vim.current.buffer[i],globals())
def ExecuteExpression(exp):
    print(">>" + exp)
    exec(exp,globals())
EOL
command! -range Ev <line1>,<line2> python3 ExecuteSelectedLine(<line1>, <line2>)

