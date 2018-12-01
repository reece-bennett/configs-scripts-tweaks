" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly.
filetype plugin on

" Show line numbers
set number

set tabstop=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Status bar
set laststatus=2 " Enabled always
set showmode " Show the editing status
set showcmd " Show (partial) command
set ruler " Show line/column information

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set list

" enable mouse usage (in all modes)
set mouse=a
