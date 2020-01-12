let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

"if dein#load_state('$HOME/.cache/dein')
"  call dein#check_clean()
"  call dein#begin('$HOME/.cache/dein')
"  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here like this:
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
"  call dein#add('simeji/winresizer')
"  call dein#add('tpope/vim-fugitive')
"  call dein#add('altercation/vim-colors-solarized')
"  call dein#add('ryanoasis/vim-devicons')
"  call dein#add('dense-analysis/ale')
"  call dein#add('Shougo/denite.nvim')
"  call dein#add('vim-airline/vim-airline')
"  call dein#add('vim-airline/vim-airline-themes')
"  call dein#add('ngmy/vim-rubocop')
"  call dein#add('tpope/vim-rails')
"  call dein#add('slim-template/vim-slim')
"  call dein#add('airblade/vim-gitgutter')
"  call dein#add('t9md/vim-quickhl')
"  call dein#add('tpope/vim-fugitive')
"  call dein#add('Shougo/neoyank.vim')
"  call dein#add('Shougo/neomru.vim')
"  if !has('nvim')
"    call dein#add('roxma/nvim-yarp')
"    call dein#add('roxma/vim-hug-neovim-rpc')
"  endif
"  call dein#end()
"  call dein#save_state()
"endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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
set listchars=tab:>-,trail:.
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" color settings
syntax enable
set background=dark
colorscheme solarized

" airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" ale
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ }

" vim-quickhl
let g:quickhl_manual_enable_at_startup=1
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" Define mappings
nnoremap <silent> <space>r  :Denite file/rec<CR>
nnoremap <silent> <space><space> :DeniteBufferDir file<CR>
nnoremap <silent> <space>vr  :Denite -resume<CR>
nnoremap <silent> <space>g  :Denite grep<CR>
nnoremap <silent> <space>cg :DeniteCursorWord grep<CR>
nnoremap <silent> <space>i  :Denite outline<CR>
nnoremap <silent> <space>f  :Denite file_mru<CR>
nnoremap <silent> <space>y  :Denite neoyank<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> u
  \ denite#do_map('move_up_path')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })

" gitgutter
autocmd BufWritePost * GitGutter
