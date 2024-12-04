-- Lua runtime config file
-- Written by Knowblesse 2020
-- Adapted for Neovim

-- Basics
vim.opt.fileformat = "unix" -- Use line ending LF (not DOS-style CR LF)
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- View settings
vim.opt.colorcolumn = "100"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scroll = 5
vim.opt.scrolloff = 8
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 4
vim.opt.splitright = true
vim.opt.equalalways = true
vim.opt.foldmethod = "indent"
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.incsearch = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Font settings
if vim.fn.has("unix") == 1 then
    print("Unix Mode")
    vim.opt.guifont = "Bitstream Vera Sans Mono 12"
else
    print("Windows Mode")
    vim.opt.guifont = "Bitstream Vera Sans Mono:h12"
end

-- Plugin management using packer.nvim
require("packer").startup(function(use)
    -- Plugin list
    use "liuchengxu/vista.vim"
    use "tpope/vim-sensible"
    use "mg979/vim-visual-multi"
    -- Buffered list instead of tab
    use "ap/vim-buftabline"
    -- NERD tree
    use "preservim/nerdtree"
    -- Git
    use "airblade/vim-gitgutter"
    use "Xuyuanp/nerdtree-git-plugin"
    use "tpope/vim-fugitive"
    -- Coding
    use "itchyny/lightline.vim"
    -- Theme
    use 'joshdick/onedark.vim'
    use "patstockwell/vim-monokai-tasty"
    -- Table generation
    use "dhruvasagar/vim-table-mode"
    --Vertical Line Generation
    use "Yggdroot/indentLine"
    -- Brackets
    use "tpope/vim-surround"
    -- Test module
    use "godlygeek/tabular"
    use "preservim/vim-markdown"
end)

-- Key bindings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>t", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<F2>", ":vertical sb<CR>")
vim.keymap.set("n", "<F3>", ":vertical sbn<CR>")
vim.keymap.set("n", "<F4>", ":wincmd =<CR>")
vim.keymap.set("n", "<F7>", ":bp<CR>")
vim.keymap.set("n", "<F8>", ":bn<CR>")
vim.keymap.set("n", "zl", "zl20")
vim.keymap.set("n", "zh", "zh20")
vim.keymap.set("n", "''", "^")
vim.keymap.set("n", ";;", "$")
vim.api.nvim_create_user_command("Swd", "cd %:p:h", {})

vim.keymap.set("n", "<leader>]", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", ":bp|bd #<CR>")

-- Edit config faster
if vim.fn.has("unix") == 1 then
    vim.keymap.set("n", "<leader>vv", ":e ~/VCF/vimrc/init.lua <CR>")
    vim.keymap.set("n", "<leader>vvv", ":e! ~/VCF/vimrc/init.lua <CR>")
else
    vim.keymap.set("n", "<leader>vv", ":e C:\\VCF\\vimrc\\init.lua <CR>")
    vim.keymap.set("n", "<leader>vvv", ":e! C:\\VCF\\vimrc\\init.lua <CR>")
    vim.keymap.set("n", "<leader>cc", ":e ~/_vimrc <CR>")
end

-- Colors and filetype settings
vim.cmd("syntax on")
vim.cmd("colorscheme vim-monokai-tasty")
vim.cmd("filetype plugin indent on")

-- Plugin-specific options
vim.opt.showmode = false
vim.g.lightline = { colorscheme = "onedark" }

vim.g.nerdtree_open = 1
vim.cmd([[
function! NERDTreeToggle()
    NERDTreeToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
        NERDTreeFind
    endif
endfunction
]])

vim.g.table_mode_corner_corner = "+"
vim.g.table_mode_separator = "|"
vim.g.coc_disable_startup_warning = 1

vim.g["vista#renderer#enable_icon"] = 0

-- Python and Arduino settings
vim.cmd([[
autocmd FileType arduino setlocal ts=2 sw=2 cindent
]])
