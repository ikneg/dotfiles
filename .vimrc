"---------------------------
"" Start Neobundle Settings.
"---------------------------
"" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'slim-template/vim-slim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'yaml.vim'
NeoBundle 'jimsei/winresizer.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

set t_Co=256
set term=xterm-256color
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
syntax enable
set background=dark
colorscheme solarized

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"  basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set showtabline=0
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
set ambiwidth=double
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set list
set splitright
set hlsearch
set nowrap
set nonumber
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
set undodir=$HOME/.vimbackup
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set incsearch
set laststatus=2
set noshowmode
set nofoldenable
set regexpengine=0

""""""""""""""""""""""""""""""""""""""""""""""""""
" タブ、空白、改行の可視化
""""""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:^\ ,trail:~,extends:>,precedes:<,nbsp:%

""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> ,f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> ,b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> ,ni :Unite<Space>-no-quit<Space>outline<CR>
nnoremap <silent> ,i :Unite<Space>outline<CR>
nnoremap <silent> ,m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> ,r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ng  :<C-u>Unite grep:. -buffer-name=search-buffer -no-quit<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,ncg :<C-u>Unite grep:. -buffer-name=search-buffer -no-quit<CR><C-R><C-W>
nnoremap <silent> <C-n> :UniteNext<CR>
nnoremap <silent> <C-p> :UnitePrevious<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" yaml
""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/yaml.vim/colors/yaml.vim

""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-quickhl
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickhl_manual_enable_at_startup=1
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

""""""""""""""""""""""""""""""""""""""""""""""""""
" coffeescript
""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_at_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" rubyのsyntax highlightは古いregex engineを使わないと激遅になる
set re=1
