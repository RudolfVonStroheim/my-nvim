syntax on
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
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'gelguy/wilder.nvim'
set encoding=UTF-8
:set completeopt-=preview
call plug#end()
lua require("mason").setup({ui = {icons = {package_installed = "✓",    package_pending = "➜", package_uninstalled = "✗"}}})
lua require("mason-lspconfig").setup()
lua require("dapui").setup()
lua require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
call wilder#setup({'modes': [':', '/', '?']})
lua << EOF
local lsp = require("lspconfig")
lsp.pyright.setup{}
lsp.bashls.setup{}
lsp.arduino_language_server.setup{}
local dap = require("dap")
dap.adapters.bashdb = {
		type = 'executable';
		command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
		name = 'bashdb';}
dap.adapters.cppdbg = {id = 'cppdbg',type = 'executable',command = '~/.local/share/nvim/mason/bin/OpenDebugAD7',}
dap.configurations.sh = 
{
		{
				type = 'bashdb';
				request = 'launch';
				name = "Launch file";
				showDebugOutput = true;
				pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
				pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
				trace = true;
				file = "${file}";
				program = "${file}";
				cwd = '${workspaceFolder}';
				pathCat = "cat";
				pathBash = "bash";
				pathMkfifo = "mkfifo";
				pathPkill = "pkill";
				args = {tempdir = "~/tmp"};
				env = {};
				terminalKind = "integrated";
		}
}

dap.configurations.cpp = 
{
		{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args ={}, 
		},
}
EOF
nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-l> :lua require'dap'.continue() <CR>
nnoremap <C-s> :lua require'dap'.step_over() <CR>
nnoremap <C-d> :lua require("dapui").toggle()<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :TerminalTab bash<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap <C-i> :Mason<CR>
colorscheme nord

