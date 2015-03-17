"---------------------------
"" Start Neobundle Settings.
"---------------------------
"" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-quickhl'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

syntax enable
set background=dark
colorscheme solarized
set t_Co=16

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

"---------------------------
"" lightline
"---------------------------
set laststatus=1
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""
"  basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set list
set splitright
set hlsearch
set nowrap
set number
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
set undodir=$HOME/.vimbackup
set encoding=utf-8
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" タブ、空白、改行の可視化
""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:^\ ,trail:~,extends:>,precedes:<,nbsp:%

""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""""""""""""""""""""""
"The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
" unite.vim keymap
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
