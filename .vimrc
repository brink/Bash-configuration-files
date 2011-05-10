
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
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

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set cpoptions=ces$

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup
set nowritebackup
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  "  let moria_style = 'dark'
  "let moria_fontface = 'mixed'
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
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on

endif " has("autocmd")
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set et!

set nu                          " Sets line numbering to on
if has("gui_running")
    " win 150 43
" colorscheme herald "Set default scheme to brimley's favorite :)
 colorscheme solarized "Set default scheme to brimley's favorite :)
 set background=dark
else
 colorscheme solarized "Set default scheme to brimley's favorite :)
 set background=light
 "   colorscheme default

endif
set ts=2
set ff=unix
let g:rubycomplete_rails = 1
"let g:fuzzy_ignore = "*.log"
"let g: fuzzy_matching_limit = 70

let mapleader = "," 

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType make set noexpandtab
autocmd FileType python set noexpandtab

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>
map <c-pagedown> <c-w>l
map <c-pageup> <c-w>h

set ignorecase
set laststatus=2
set statusline= 
set statusline+=%<\                       " cut at start 
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags 
set statusline+=%-40f\                    " relative path 
set statusline+=%=                        " separate between right- and left-aligned 
"set statusline+=%{GitBranch()}\ 
set statusline+=%1*%y%*%*\                " file type 
set statusline+=%10((%l/%L)%)\            " line and column 
set statusline+=%P                        " percentage of file

set list
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¶
let g:solarized_visibility="low"

