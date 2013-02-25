" sensible.vim - Defaults everyone can agree on
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>
" Version:      1.0

" Enable Vim compatible mode.
set nocompatible

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
  syntax enable
endif

" Don't scan included files. The .tags file is more performant.
set complete-=i

" When inserting paren, jump briefly to matching one.
set showmatch

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Round autoindentation. No one needs 3 spaces when you indent by two.
set shiftround

" Indent using two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Show mode in statusbar, not separately.
set noshowmode

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
set ttimeout
set ttimeoutlen=50

" Enable highlighted case-insensitive incremential search.
set incsearch
set hlsearch
set ignorecase

" Don't ignore case when search has capital letters
" (although also don't ignore case by default).
set smartcase

" Do not wrap lines. But if, do it ad convenient points.
set nowrap
set linebreak

" Show line numbers on sidebar and statusbar.
set number

" Don't ask if to safe buffers on close.
set autowrite
set hidden

" Disable anoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (for security reasons).
set nomodeline

" Do not fold by default. But if, do it to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Use `Ctrl-L` to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Always show window statuses, even if there's only one.
set laststatus=2

" Show the line and column number of the cursor position.
set ruler

" Show the size of block one selected in visual mode.
set showcmd

" Autocomplete commands using nice menu in place of window status.
" Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.
set wildmenu

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Show all whitespaces by default.
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
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
set history=1000

" Enable mouse for scrolling and window resizing.
set mouse=nicr

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Disable swap to prevent annoying messages.
set noswapfile

" Save up to 100 marks, enable capital marks.
set viminfo='100,f1

" Create and set directories for backup and undo files.
let s:dir = has('mac') ? '~/Library/Vim' : '~/.local/share/vim'
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end

let &backupdir = expand(s:dir) . '/backup//'
if exists('+undodir')
  let &undodir = expand(s:dir) . '/undo//'
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

" Add gems.tags to files searched for tags.
set tags+=gems.tags
