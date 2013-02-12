" sensible.vim - Defaults everyone can agree on
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>
" Version:      1.0

" Don't configure if one requests vi-compatible mode.
if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Don't scan included files. Tags file is more performant.
set complete-=i

" When inserting paren, jump briefly to matching one.
set showmatch

" Autoindent when starting new line, or using "o" or "O".
set autoindent

" Round autoindentation. No one needs 3 spaces when you indent by two.
set shiftround

" Use 'shiftwidth' when using <Tab> in front of a line.
" By default it's used only for shift commands ("<", ">").
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including Esc, while preserving
" no timeout after pressing it manually.
set ttimeout
set ttimeoutlen=50

" Enable incremential search.
set incsearch

" Don't ignore case when search has capital letters.
" (although also don't ignore case by default).
set smartcase

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Always show window statuses, even if there's only one.
set laststatus=2

" Show the line and column number of the cursor position.
set ruler

" Show the size of block one selected in visual mode.
set showcmd

" Autocomplete commands using nice menu in place of window status.
set wildmenu

" Keep one line above or below the cursor when scrolling.
if !&scrolloff
  set scrolloff=1
endif

" Keep 5 columns next to the cursor when scrolling horizontally.
if !&sidescrolloff
  set sidescrolloff=5
endif

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Show all whitespaces by default.
if !&list && &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

" Reload unchanged files automatically.
set autoread

" Automatically save file as buffer goes away.
set autowrite

" Support all kind of EOLs by default.
set fileformats+=mac

" Always save upper case variables to viminfo file.
set viminfo^=!

" Increase history size to 1000 items.
if &history < 1000
  set history=1000
endif

let s:dir = has('win32') ? '~/Application Data/Vim' : has('mac') ? '~/Library/Vim' : '~/.local/share/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif
if exists('+undofile')
  set undofile
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Hide dotfiles, backup files and tag files by default.
if !exists('g:netrw_list_hide')
  let g:netrw_list_hide = '^\.,\~$,^tags$'
endif


" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" vim:set ft=vim et sw=2:
