" basic settings
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
set showtabline=0
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smarttab
set shiftround
set splitright
set hlsearch
set nowrap
set nonumber
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
set undodir=$HOME/.vimbackup
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set laststatus=2
set noshowmode
set nofoldenable
set regexpengine=0
set list
set listchars=tab:>-,trail:-
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
let mapleader = "\<Space>"
set completeopt-=preview
