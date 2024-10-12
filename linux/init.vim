set number
set tabstop=4
set softtabstop=4
set autoindent
set mouse=a
set smarttab
set smartindent
call plug#begin()
Plug 'NeogitOrg/neogit'
Plug 'nvim-lua/plenary.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rcarriga/nvim-notify'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/nvim-neo-tree/neo-tree.nvim', {'branch': 'v3.x'}
Plug 'MunifTanjim/nui.nvim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/williamboman/mason.nvim'
Plug 'https://github.com/preservim/tagbar' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
function! UpdateRemotePlugins(...)
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction
Plug 'gelguy/wilder.nvim', {'do': function('UpdateRemotePlugins')}
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-neotest/nvim-nio'
set encoding=UTF-8
:set completeopt-=preview
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()
lua << EOF
require("mason").setup({ui = {icons = {package_installed = "✓",    package_pending = "➜", package_uninstalled = "✗"}}})
require("mason-lspconfig").setup()
require("dapui").setup()
require('lspconfig').pylsp.setup{}
require'lspconfig'.pyright.setup{cmd = {'pyright-langserver.cmd', '--stdio'}, 
root_dir =  function(fname)
				return vim.fn.getcwd()
		end
}
require'lspconfig'.bashls.setup{}

require('dap-python').setup('~/venvs/venv/bin/python')
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.arduino_language_server.setup{}
require'dap'.adapters.bashdb = {type = 'executable'; command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter'; name = 'bashdb';}
require'dap'.adapters.cppdbg = {id = 'cppdbg',type = 'executable',command = '~/extension/debugAdapters/bin/OpenDebugAD7',}
require'dap'.configurations.sh = {{type = 'bashdb';request = 'launch';name = "Launch file";showDebugOutput = true;pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';trace = true;file = "${file}";program = "${file}";cwd = '${workspaceFolder}';pathCat = "cat";pathBash = "/bin/bash";pathMkfifo = "mkfifo";pathPkill = "pkill";args = {};env = {};terminalKind = "integrated";}}
local neogit = require('neogit')
neogit.setup {}
require'dap'.set_log_level('DEBUG')
EOF
lua require("catppuccin").setup({flavour = "frappe", transparent_background = true, styles = {comments = "italic", conditionals = "italic"}})

set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <A-r> <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
call wilder#setup({'modes': [':', '/', '?']})
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
noremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-l> :lua require'dap'.continue() <CR>
nnoremap <C-s> :lua require'dap'.step_over() <CR>
nnoremap <C-d> :lua require("dapui").toggle()<CR>
nnoremap <C-t> :Neotree<CR>
nnoremap <C-c> :TerminalTab C:\Windows\System32\cmd.exe<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap <C-i> :Mason<CR>
nnoremap <C-f> :CocCommand editor.action.formatDocument<CR>
nnoremap <C-o> :CocCommand pyright.organizeImport<CR>
nnoremap <C-g> :Neogit<CR>
nnoremap <C-f> :ToggleTerm direction=tab
colorscheme catppuccin
let g:airline_theme = "catppuccin"
