iset number
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
set encoding=UTF-8
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
:set completeopt-=preview
call plug#end()
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-r> :terminal<CR>
nnoremap <C-p> :TagbarToggle<CR>
colorscheme alduin
