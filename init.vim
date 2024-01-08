set number
set tabstop=4
set softtabstop=4
set autoindent
set mouse=a
set smarttab
set smartindent
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'https://github.com/williamboman/mason.nvim'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
set encoding=UTF-8
:set completeopt-=preview
call plug#end()
lua require("mason").setup({ui = {icons = {package_installed = "✓",    package_pending = "➜", package_uninstalled = "✗"}}})
lua require("mason-lspconfig").setup()
lua require("dapui").setup()
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.arduino_language_server.setup{}
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require'dap'.adapters.bashdb = {type = 'executable'; command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter'; name = 'bashdb';}
lua require'dap'.adapters.cppdbg = {id = 'cppdbg',type = 'executable',command = '~/extension/debugAdapters/bin/OpenDebugAD7',}
lua require'dap'.configurations.sh = {{type = 'bashdb';request = 'launch';name = "Launch file";showDebugOutput = true;pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';trace = true;file = "${file}";program = "${file}";cwd = '${workspaceFolder}';pathCat = "cat";pathBash = "/bin/bash";pathMkfifo = "mkfifo";pathPkill = "pkill";args = {};env = {};terminalKind = "integrated";}}
nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-l> :lua require'dap'.continue() <CR>
nnoremap <C-s> :lua require'dap'.step_over() <CR>
nnoremap <C-d> :lua require("dapui").toggle()<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :terminal<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap <C-i> :Mason<CR>
colorscheme alduin
