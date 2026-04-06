" --- 1. General Settings ---
set nocompatible
set number
set mouse=a
set termguicolors
set updatetime=100
set clipboard+=unnamedplus
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Fix for Escape key latency
set ttimeout
set ttimeoutlen=10
set timeoutlen=500
set backspace=indent,eol,start

" --- 2. Plugin Management (vim-plug) ---
call plug#begin('~/.local/share/nvim/plugged')

" Productivity & Math
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'

" Completion & UI
Plug 'saghen/blink.cmp', { 'do': 'cargo build --release' } 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ellisonleao/gruvbox.nvim'

" Git Integration
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

call plug#end()

" --- 3. Plugin Setup (Lua) ---
lua << EOF
require('Comment').setup()
require('gitsigns').setup()
require('nvim-tree').setup()
require('blink.cmp').setup({
  keymap = { preset = 'default' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
EOF

" --- 4. Theme & UI ---
syntax enable
let g:gruvbox_italic = 1
colorscheme gruvbox

" --- 5. Mappings ---
let mapleader = " "
let maplocalleader = " "

" LaTeX shortcuts
imap \eqr \eqref{eqn:
imap \lae \label{eqn:
imap \laf \label{fig:
imap \lat \label{tab:

" Utility mappings
map <C-n> :NvimTreeToggle<CR>
noremap <Leader>s :update<CR>

" --- 6. Custom Functions & Hooks ---

" --- 7. MathSubstitute Logic (Improved with Error Handling) ---
function! MathSubstitute(pattern, replace, ...) abort
  if &paste | return | endif 
  " Default flags are 'g' (global). We force 'e' (silent) to prevent E486 errors.
  let l:flags = get(a:, 1, 'g') . 'e'
  
  " 1. Handle inline math $...$
  execute "silent! %s/\\$[^$]*\\zs" . a:pattern . "\\ze[^$]*\\$/" . a:replace . "/" . l:flags
  
  " 2. Handle display math \[...\]
  execute "silent! %s/\\\\\\[[^]]*\\zs" . a:pattern . "\\ze[^]]*\\\\\\]/" . a:replace . "/" . l:flags
  
  " 3. Handle specific LaTeX environments
  for l:env in ['equation', 'align', 'gather', 'multline', 'eqnarray']
    for l:suffix in ['', '*']
      let l:pat = '%s/\\\\begin{' . l:env . l:suffix . '}\\_.\\{-}\\zs' . a:pattern . '\\ze\\_.\\{-}\\\\end{' . l:env . l:suffix . '}/' . a:replace . '/' . l:flags
      execute "silent! " . l:pat
    endfor
  endfor
  
  " Clear the search highlight so your screen doesn't stay yellow/selected
  let @/ = ""
endfunction

command! -nargs=+ MathSub call MathSubstitute(<f-args>)
let g:tex_flavor = 'latex'
let g:vimtex_view_method='skim'
