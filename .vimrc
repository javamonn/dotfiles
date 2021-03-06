set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-bundler'
Plugin 'altercation/vim-colors-solarized'
Plugin 'groenewege/vim-less'
Plugin 'nelstrom/vim-qargs'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdcommenter'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
call vundle#end()


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set mouse=

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

let mapleader = " "
filetype plugin on

set tabstop=2

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType sql setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType less setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType sh setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType liquid setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType config setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType dockerfile setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

au BufNewFile,BufRead *.eliom set filetype=ocaml
au BufNewFile,BufRead *.ssp set filetype=html
au BufNewFile,BufRead *.conf set filetype=config
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>n :NERDTreeToggle<CR>

syntax enable
set background=dark
colorscheme solarized

set nobackup
set number
set nowritebackup
set wildignore+=node_modules/**,icenine/app/libs/**/*,public/**/*

let g:tmux_navigator_save_on_switch = 1

" MERLIN
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
nnoremap <leader>i :TypeOf<CR>

execute "set rtp+=" . g:opamshare . "/merlin/vim"
""""""""
" SUPERTAB
let g:SuperTabDefaultCompletionType = "context"
"""""""""

""""""""""""""""""""""""
" SYNTASTIC CONFIG
"""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep257', 'pep8']
let g:syntastic_ruby_checkers = ['']
let g:syntastic_eruby_checkers = ['']
let g:syntastic_html_checkers = ['']
let g:syntastic_less_checkers = ['']
let g:syntastic_c_checkers = ['']
let g:syntastic_scala_checkers = ['']
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_disabled_filetypes = ['html', 'rb', 'scala']
let g:syntastic_javascript_checkers = ['standard']
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
"""""""""""""""""""""""""""""""""""""""
