" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Vundle
filetype off    " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
" Plugin 'kchmck/vim-coffee-script'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe', { 'do': '/usr/local/bin/python3 install.py' }
Plugin 'tenfyzhong/CompleteParameter.vim'
Plugin 'dimasg/vim-mark'
Plugin 'moll/vim-node'
Plugin 'fatih/vim-go'
" Plugin 'vim-syntastic/syntastic'
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'w0rp/ale'
Plugin 'iamcco/markdown-preview.vim'

" colorscheme
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'pseewald/vim-anyfold'

" Github repos of the user 'vim-scripts'
" => can omit the username part
Plugin 'vim-auto-save'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on   " required!
" Vundle END

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" performance {
set ttyfast
" set lazyredraw
set scrolljump=8
" }
"
" color {
syn on
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
" colorscheme molokai
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
colorscheme palenight
let g:airline_theme='palenight'
let g:palenight_terminal_italics=1
" colorscheme OceanicNext 
" let g:airline_theme='oceanicnext'
" }

" macvim {
set guifont=Menlo\ Regular:h16
set linespace=2
set guioptions-=r
set guioptions-=L
" }
"
" tab {
set expandtab     " 使用空格代替tab
set shiftwidth=2  " 设定indent为n个空格
set tabstop=2     " 设定tab长度为n个空格
set softtabstop=2 " 退格时可以一次删掉n个空格
" }

set cmdheight=2
set history=50		" keep 50 lines of command line history
" set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set helplang=cn
set bs=2		      " 在insert模式下用退格键删除
set showmatch		  " 代码匹配
set laststatus=2	" 总是显示状态栏
set number
set cursorline
set fileencodings=utf-8,gbk
set wrap          " 自动折行
map j gj
map k gk

" search {
set hls
set ignorecase
set incsearch		  " do incremental searching
" }

" fold {
" set foldmethod=syntax
" set foldenable!
autocmd Filetype * AnyFoldActivate
set foldlevel=99
" }

" undo持久化 {
set undofile
set undodir=~/.vim/undodir
" }

" airline {
let g:airline#extensions#tabline#enabled = 1
" }

" NERDTree {
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }

" autosave {
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
"}
" taglist for coffee {
" let g:tlist_coffee_settings = 'coffee;f:function;v:variable'
" let g:tagbar_type_coffee = {
"     \ 'ctagstype' : 'coffee',
"     \ 'kinds'     : [
"         \ 'c:classes',
"         \ 'm:methods',
"         \ 'f:functions',
"         \ 'v:variables',
"         \ 'f:fields',
"     \ ]
" \ }
" } -- taglist
"
" ctrlp {
let g:ctrlp_working_path_mode = ''
" }
"
" tern {
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
set completeopt-=preview
" }
"
" syntastic {
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" }
"
" nerdtree-git-plugin {
" let g:NERDTreeIndicatorMapCustom = {
"       \ "Untracked" : '?',
"       \ "Modified"  : '✱',
"       \ "Staged"    : '✔︎',
"       \ "Renamed"   : '➜',
"       \ "Unmerged"  : 'j',
"       \ "Deleted"   : '✖',
"       \ "Dirty"     : '!',
"       \ "Clean"     : 'o',
"       \ "Unknown"   : '?'
"       \ }
"}
"
" vim-gitgutter {
" let g:gitgutter_sign_added = '✚'
" let g:gitgutter_sign_modified = '✱'
" let g:gitgutter_sign_removed = '➡'
" let g:gitgutter_sign_removed_first_line = '➜'
" let g:gitgutter_sign_modified_removed = '➽'
" }
"
" ale {
" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \}
let g:ale_sign_error = '••'
let g:ale_sign_warning = '・'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" }
"
" python-mode {
let g:pymode_lint = 0
let g:pymode_lint_unmodified = 0
let g:pymode_options_max_line_length=120
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
" }

let mapleader='\'
nnoremap <C-l> gt
nnoremap <C-h> gT
" nnoremap <leader>t : tabe<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <C-t> :tab split<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>

" copy and paste
set clipboard=unnamed

" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa
" vnoremap <C-c> "+y
" map <C-c> "+yy
" map <C-x> "+p

" sort text
map <C-o> :sort<CR>

" vim-node
map gvf <C-W>vgf
map gxf <C-W>f

" vim-fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gf :Gvdiff<CR>

" CompleteParameter
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

" YouCompleteMe
nnoremap <leader>gpd :split<CR>:exec("YcmComplete GoToDefinitionElseDeclaration")<CR>

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap_error)
nmap <silent> <C-j> <Plug>(ale_next_wrap_error)

" vim-anyfold
map <c-]> za
hi Folded ctermfg=235 ctermbg=39 guifg=#292D3E guibg=#939ede
