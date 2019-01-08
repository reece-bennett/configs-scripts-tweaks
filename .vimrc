" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly.
filetype plugin on

" Show line numbers
set number

" Tabs
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

" Enable mouse usage (in all modes)
set mouse=a

" Change the cursor when changing mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Disable visual bell (why is this even a thing?!)
set t_vb=
