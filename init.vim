set backspace=indent,eol,start
set autoindent
set backup
set ruler
set number
set spell
set spellfile=~/.config/nvim/spell/en.utf-8.add
let g:tex_comment_nospell=1
set mouse=a
set wrap
set wrap linebreak nolist
set termguicolors
set whichwrap+=<,>,h,l,[,]
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=syntax
filetype plugin indent on
set updatetime=100

let g:tex_flavor = 'latex'
let g:vimtex_view_method='skim'
"let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_quickfix_ignore_filters = [
          \ 'Overfull',
          \ 'Underfull',
          \]

"let g:vimtex_quickfix_latexlog = {'default' : 0}

let g:deoplete#enable_at_startup = 1

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction


call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'morhetz/gruvbox' "color scheme
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

" theme
let g:gruvbox_contrast_dark = 'dark'
syntax enable
colorscheme gruvbox

imap \eqr \eqref{eqn:
imap \lae \label{eqn:
imap \laf \label{fig:
imap \lat \label{tab:
map <C-n> :NERDTreeToggle<CR>
noremap <Leader>s :update<CR>
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
