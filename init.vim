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
Plug 'mhartington/formatter.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'gelguy/wilder.nvim'
set encoding=UTF-8
:set completeopt-=preview
call plug#end()
lua require("mason").setup({ui = {icons = {package_installed = "✓",    package_pending = "➜", package_uninstalled = "✗"}}})
lua require("mason-lspconfig").setup()
lua require("dapui").setup()
lua require('dap-python').setup('~/venvs/venv/bin/python')
call wilder#setup({'modes': [':', '/', '?']})

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" " utf-8 byte sequence
" set encoding=utf-8
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
"
" " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" " delays and poor user experience
" set updatetime=300
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate
" " NOTE: There's always complete item selected by default, you may want to
" enable
" " no select by `"suggest.noselect": true` in your configuration file
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"             \ CheckBackspace() ? "\<Tab>" :
"                   \ coc#refresh()
"                   inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1)
"                   : "\<C-h>"
"
"                   " Make <CR> to accept selected completion item or notify
"                   coc.nvim to format
"                   " <C-g>u breaks current undo, please make your own choice
"                   inoremap <silent><expr> <CR> coc#pum#visible() ?
"                   coc#pum#confirm()
"                                                 \:
"                                                 "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"                                                 function! CheckBackspace()
"                                                 abort
"                                                   let col = col('.') - 1
"                                                     return !col ||
"                                                     getline('.')[col - 1]
"                                                     =~# '\s'
"                                                     endfunction
"
"                                                     " Use <c-space> to
"                                                     trigger completion
"                                                     if has('nvim')
"                                                       inoremap
"                                                       <silent><expr>
"                                                       <c-space>
"                                                       coc#refresh()
"                                                       else
"                                                         inoremap
"                                                         <silent><expr> <c-@>
"                                                         coc#refresh()
"                                                         endif
"
"                                                         " Use `[g` and `]g`
"                                                         to navigate
"                                                         diagnostics
"                                                         " Use
"                                                         `:CocDiagnostics` to
"                                                         get all diagnostics
"                                                         of current buffer in
"                                                         location list
"                                                         nmap <silent> [g
"                                                         <Plug>(coc-diagnostic-prev)
"                                                         nmap <silent> ]g
"                                                         <Plug>(coc-diagnostic-next)
"
"                                                         " GoTo code
"                                                         navigation
"                                                         nmap <silent> gd
"                                                         <Plug>(coc-definition)
"                                                         nmap <silent> gy
"                                                         <Plug>(coc-type-definition)
"                                                         nmap <silent> gi
"                                                         <Plug>(coc-implementation)
"                                                         nmap <silent> gr
"                                                         <Plug>(coc-references)
"
"                                                         " Use K to show
"                                                         documentation in
"                                                         preview window
"                                                         nnoremap <silent> K
"                                                         :call
"                                                         ShowDocumentation()<CR>
"
"                                                         function!
"                                                         ShowDocumentation()
"                                                           if
"                                                           CocAction('hasProvider',
"                                                           'hover')
"                                                               call
"                                                               CocActionAsync('doHover')
"                                                                 else
"                                                                     call
"                                                                     feedkeys('K',
"                                                                     'in')
"                                                                       endif
"                                                                       endfunction
"
"                                                                       "
"                                                                       Highlight
"                                                                       the
"                                                                       symbol
"                                                                       and
"                                                                       its
"                                                                       references
"                                                                       when
"                                                                       holding
"                                                                       the
"                                                                       cursor
"                                                                       autocmd
"                                                                       CursorHold
"                                                                       *
"                                                                       silent
"                                                                       call
"                                                                       CocActionAsync('highlight')
"
"                                                                       "
"                                                                       Symbol
"                                                                       renaming
"                                                                       nmap
"                                                                       <leader>rn
"                                                                       <Plug>(coc-rename)
"
"                                                                       "
"                                                                       Formatting
"                                                                       selected
"                                                                       code
"                                                                       xmap
"                                                                       <leader>f
"                                                                       <Plug>(coc-format-selected)
"                                                                       nmap
"                                                                       <leader>f
"                                                                       <Plug>(coc-format-selected)
"
"                                                                       augroup
"                                                                       mygroup
"                                                                         autocmd!
"                                                                           "
"                                                                           Setup
"                                                                           formatexpr
"                                                                           specified
"                                                                           filetype(s)
"                                                                             autocmd
"                                                                             FileType
"                                                                             typescript,json
"                                                                             setl
"                                                                             formatexpr=CocAction('formatSelected')
"                                                                               "
"                                                                               Update
"                                                                               signature
"                                                                               help
"                                                                               on
"                                                                               jump
"                                                                               placeholder
"                                                                                 autocmd
"                                                                                 User
"                                                                                 CocJumpPlaceholder
"                                                                                 call
"                                                                                 CocActionAsync('showSignatureHelp')
"                                                                                 augroup
"                                                                                 end
"
"                                                                                 "
"                                                                                 Applying
"                                                                                 code
"                                                                                 actions
"                                                                                 to
"                                                                                 the
"                                                                                 selected
"                                                                                 code
"                                                                                 block
"                                                                                 "
"                                                                                 Example:
"                                                                                 `<leader>aap`
"                                                                                 for
"                                                                                 current
"                                                                                 paragraph
"                                                                                 xmap
"                                                                                 <leader>a
"                                                                                 <Plug>(coc-codeaction-selected)
"                                                                                 nmap
"                                                                                 <leader>a
"                                                                                 <Plug>(coc-codeaction-selected)
"
"                                                                                 "
"                                                                                 Remap
"                                                                                 keys
"                                                                                 for
"                                                                                 applying
"                                                                                 code
"                                                                                 actions
"                                                                                 at
"                                                                                 the
"                                                                                 cursor
"                                                                                 position
"                                                                                 nmap
"                                                                                 <leader>ac
"                                                                                 <Plug>(coc-codeaction-cursor)
"                                                                                 "
"                                                                                 Remap
"                                                                                 keys
"                                                                                 for
"                                                                                 apply
"                                                                                 code
"                                                                                 actions
"                                                                                 affect
"                                                                                 whole
"                                                                                 buffer
"                                                                                 nmap
"                                                                                 <leader>as
"                                                                                 <Plug>(coc-codeaction-source)
"                                                                                 "
"                                                                                 Apply
"                                                                                 the
"                                                                                 most
"                                                                                 preferred
"                                                                                 quickfix
"                                                                                 action
"                                                                                 to
"                                                                                 fix
"                                                                                 diagnostic
"                                                                                 on
"                                                                                 the
"                                                                                 current
"                                                                                 line
"                                                                                 nmap
"                                                                                 <leader>qf
"                                                                                 <Plug>(coc-fix-current)
"
"                                                                                 "
"                                                                                 Remap
"                                                                                 keys
"                                                                                 for
"                                                                                 applying
"                                                                                 refactor
"                                                                                 code
"                                                                                 actions
"                                                                                 nmap
"                                                                                 <silent>
"                                                                                 <leader>re
"                                                                                 <Plug>(coc-codeaction-refactor)
"                                                                                 xmap
"                                                                                 <silent>
"                                                                                 <leader>r
"                                                                                 <Plug>(coc-codeaction-refactor-selected)
"                                                                                 nmap
"                                                                                 <silent>
"                                                                                 <leader>r
"                                                                                 <Plug>(coc-codeaction-refactor-selected)
"
"                                                                                 "
"                                                                                 Run
"                                                                                 the
"                                                                                 Code
"                                                                                 Lens
"                                                                                 action
"                                                                                 on
"                                                                                 the
"                                                                                 current
"                                                                                 line
"                                                                                 nmap
"                                                                                 <leader>cl
"                                                                                 <Plug>(coc-codelens-action)
"
"                                                                                 "
"                                                                                 Map
"                                                                                 function
"                                                                                 and
"                                                                                 class
"                                                                                 text
"                                                                                 objects
"                                                                                 "
"                                                                                 NOTE:
"                                                                                 Requires
"                                                                                 'textDocument.documentSymbol'
"                                                                                 support
"                                                                                 from
"                                                                                 the
"                                                                                 language
"                                                                                 server
"                                                                                 xmap
"                                                                                 if
"                                                                                 <Plug>(coc-funcobj-i)
"                                                                                 omap
"                                                                                 if
"                                                                                 <Plug>(coc-funcobj-i)
"                                                                                 xmap
"                                                                                 af
"                                                                                 <Plug>(coc-funcobj-a)
"                                                                                 omap
"                                                                                 af
"                                                                                 <Plug>(coc-funcobj-a)
"                                                                                 xmap
"                                                                                 ic
"                                                                                 <Plug>(coc-classobj-i)
"                                                                                 omap
"                                                                                 ic
"                                                                                 <Plug>(coc-classobj-i)
"                                                                                 xmap
"                                                                                 ac
"                                                                                 <Plug>(coc-classobj-a)
"                                                                                 omap
"                                                                                 ac
"                                                                                 <Plug>(coc-classobj-a)
"
"                                                                                 "
"                                                                                 Remap
"                                                                                 <C-f>
"                                                                                 and
"                                                                                 <C-b>
"                                                                                 to
"                                                                                 scroll
"                                                                                 float
"                                                                                 windows/popups
"                                                                                 if
"                                                                                 has('nvim-0.4.0')
"                                                                                 ||
"                                                                                 has('patch-8.2.0750')
"                                                                                   nnoremap
"                                                                                   <silent><nowait><expr>
"                                                                                   <C-f>
"                                                                                   coc#float#has_scroll()
"                                                                                   ?
"                                                                                   coc#float#scroll(1)
"                                                                                   :
"                                                                                   "\<C-f>"
"                                                                                     nnoremap
"                                                                                     <silent><nowait><expr>
"                                                                                     <C-b>
"                                                                                     coc#float#has_scroll()
"                                                                                     ?
"                                                                                     coc#float#scroll(0)
"                                                                                     :
"                                                                                     "\<C-b>"
"                                                                                       inoremap
"                                                                                       <silent><nowait><expr>
"                                                                                       <C-f>
"                                                                                       coc#float#has_scroll()
"                                                                                       ?
"                                                                                       "\<c-r>=coc#float#scroll(1)\<cr>"
"                                                                                       :
"                                                                                       "\<Right>"
"                                                                                         inoremap
"                                                                                         <silent><nowait><expr>
"                                                                                         <C-b>
"                                                                                         coc#float#has_scroll()
"                                                                                         ?
"                                                                                         "\<c-r>=coc#float#scroll(0)\<cr>"
"                                                                                         :
"                                                                                         "\<Left>"
"                                                                                           vnoremap
"                                                                                           <silent><nowait><expr>
"                                                                                           <C-f>
"                                                                                           coc#float#has_scroll()
"                                                                                           ?
"                                                                                           coc#float#scroll(1)
"                                                                                           :
"                                                                                           "\<C-f>"
"                                                                                             vnoremap
"                                                                                             <silent><nowait><expr>
"                                                                                             <C-b>
"                                                                                             coc#float#has_scroll()
"                                                                                             ?
"                                                                                             coc#float#scroll(0)
"                                                                                             :
"                                                                                             "\<C-b>"
"                                                                                             endif
"
"                                                                                             "
"                                                                                             Use
"                                                                                             CTRL-S
"                                                                                             for
"                                                                                             selections
"                                                                                             ranges
"                                                                                             "
"                                                                                             Requires
"                                                                                             'textDocument/selectionRange'
"                                                                                             support
"                                                                                             of
"                                                                                             language
"                                                                                             server
"                                                                                             nmap
"                                                                                             <silent>
"                                                                                             <C-s>
"                                                                                             <Plug>(coc-range-select)
"                                                                                             xmap
"                                                                                             <silent>
"                                                                                             <C-s>
"                                                                                             <Plug>(coc-range-select)
"
"                                                                                             "
"                                                                                             Add
"                                                                                             `:Format`
"                                                                                             command
"                                                                                             to
"                                                                                             format
"                                                                                             current
"                                                                                             buffer
"                                                                                             command!
"                                                                                             -nargs=0
"                                                                                             Format
"                                                                                             :call
"                                                                                             CocActionAsync('format')
"
"                                                                                             "
"                                                                                             Add
"                                                                                             `:Fold`
"                                                                                             command
"                                                                                             to
"                                                                                             fold
"                                                                                             current
"                                                                                             buffer
"                                                                                             command!
"                                                                                             -nargs=?
"                                                                                             Fold
"                                                                                             :call
"                                                                                             CocAction('fold',
"                                                                                             <f-args>)
"
"                                                                                             "
"                                                                                             Add
"                                                                                             `:OR`
"                                                                                             command
"                                                                                             for
"                                                                                             organize
"                                                                                             imports
"                                                                                             of
"                                                                                             the
"                                                                                             current
"                                                                                             buffer
"                                                                                             command!
"                                                                                             -nargs=0
"                                                                                             OR
"                                                                                             :call
"                                                                                             CocActionAsync('runCommand',
"                                                                                             'editor.action.organizeImport')
"
"                                                                                             "
"                                                                                             Add
"                                                                                             (Neo)Vim's
"                                                                                             native
"                                                                                             statusline
"                                                                                             support
"                                                                                             "
"                                                                                             NOTE:
"                                                                                             Please
"                                                                                             see
"                                                                                             `:h
"                                                                                             coc-status`
"                                                                                             for
"                                                                                             integrations
"                                                                                             with
"                                                                                             external
"                                                                                             plugins
"                                                                                             that
"                                                                                             "
"                                                                                             provide
"                                                                                             custom
"                                                                                             statusline:
"                                                                                             lightline.vim,
"                                                                                             vim-airline
"                                                                                             set
"                                                                                             statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"                                                                                             "
"                                                                                             Mappings
"                                                                                             for
"                                                                                             CoCList
"                                                                                             "
"                                                                                             Show
"                                                                                             all
"                                                                                             diagnostics
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>a
"                                                                                             :<C-u>CocList
"                                                                                             diagnostics<cr>
"                                                                                             "
"                                                                                             Manage
"                                                                                             extensions
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>e
"                                                                                             :<C-u>CocList
"                                                                                             extensions<cr>
"                                                                                             "
"                                                                                             Show
"                                                                                             commands
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>c
"                                                                                             :<C-u>CocList
"                                                                                             commands<cr>
"                                                                                             "
"                                                                                             Find
"                                                                                             symbol
"                                                                                             of
"                                                                                             current
"                                                                                             document
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>o
"                                                                                             :<C-u>CocList
"                                                                                             outline<cr>
"                                                                                             "
"                                                                                             Search
"                                                                                             workspace
"                                                                                             symbols
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>s
"                                                                                             :<C-u>CocList
"                                                                                             -I
"                                                                                             symbols<cr>
"                                                                                             "
"                                                                                             Do
"                                                                                             default
"                                                                                             action
"                                                                                             for
"                                                                                             next
"                                                                                             item
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>j
"                                                                                             :<C-u>CocNext<CR>
"                                                                                             "
"                                                                                             Do
"                                                                                             default
"                                                                                             action
"                                                                                             for
"                                                                                             previous
"                                                                                             item
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>k
"                                                                                             :<C-u>CocPrev<CR>
"                                                                                             "
"                                                                                             Resume
"                                                                                             latest
"                                                                                             coc
"                                                                                             list
"                                                                                             nnoremap
"                                                                                             <silent><nowait>
"                                                                                             <space>p
"                                                                                             :<C-u>CocListResume<CR>
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
nnoremap <A-f> :Telescope find_files<cr>
nnoremap <A-g> :Telescope live_grep<cr>
nnoremap <A-b> :Telescope buffers<cr>
nnoremap <A-h> :Telescope help_tags<cr>
nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-l> :lua require'dap'.continue() <CR>
nnoremap <C-s> :lua require'dap'.step_over() <CR>
nnoremap <C-d> :lua require("dapui").toggle()<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :TerminalTab bash<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap <C-i> :Mason<CR>
nnoremap <A-f> :CocCommand editor.action.formatDocument <CR>
colorscheme nord

