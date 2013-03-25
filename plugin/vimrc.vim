" vimrc.vim - Plugin serving as .vimrc replacement.
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>
" Version:      1.0

"" Compatible with [`vim-sensible`](https://github.com/tpope/vim-sensible)

" Disable strange Vi defaults.
set nocompatible

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
  syntax enable
endif

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Don't scan included files. The .tags file is more performant.
set complete-=i

" When inserting paren, jump briefly to matching one.
set showmatch

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Round autoindentation. No one needs 3 spaces when you indent by two.
set shiftround

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
set ttimeout
set ttimeoutlen=50

" Indent using two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Enable highlighted case-insensitive incremential search.
set incsearch

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

" Increase history size to 1000 items.
set history=1000

" Allow for up to 50 opened tabs on Vim start.
set tabpagemax=50

" Always save upper case variables to viminfo file.
set viminfo^=!

" Create and set directories for backup and undo files.
let s:dir = match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end

" Enable back and undo files by default.
let &backupdir = expand(s:dir) . '/backup//'
if exists('+undodir')
  let &undodir = expand(s:dir) . '/undo//'
  if exists('+undofile')
    set undofile
  endif
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

" `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo,
" so that you can undo `Ctrl-U` without undoing what you typed before it.
inoremap <C-U> <C-G>u<C-U>

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$


"" Compatible with my taste ;) (you can change them in fork)

" Use more readable color scheme by default
colorscheme wombat256mod

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Hide buffers instead of asking if to save them.
set hidden

" But if so, do it at convenient points.
set wrap linebreak
set showbreak=…
vmap j gj
vmap k gk
vmap $ g$
vmap ^ g^
vmap 0 g^
nmap j gj
nmap k gk
nmap $ g$
nmap ^ g^
nmap 0 g^

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Show line numbers on the sidebar.
set number

" Higlight current line
set cursorline

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Do not fold by default. But if, do it up to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Enable mouse for scrolling and window resizing.
set mouse=a

" Disable swap to prevent annoying messages.
set noswapfile

" Save up to 100 marks, enable capital marks.
set viminfo='100,f1

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
set ignorecase

" Show mode in statusbar, not separately.
set noshowmode

" Don't ignore case when search has capital letters
" (although also don't ignore case by default).
set smartcase

" Use dash as word separator.
set iskeyword+=-

" Add gems.tags to files searched for tags.
set tags+=gems.tags

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Use arrows for scrolling instead of moving cursor.
nnoremap <Down> <c-e>
nnoremap <Up> <c-y>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26)
noremap gV `[v`]

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Automatically change cursor type in iTerm2 for insert mode.
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

" Enable global substitute by default
set gdefault

" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Enable normal regex handling
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" Make macros faster by deferring window redrawing
set lazyredraw

" Set window title by default
set title

" Yank/paste to the OS clipboard with ,y and ,p
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Exit insert mode by presing jj or kk
inoremap jj <ESC>
inoremap kk <ESC>

" Always focus on splited window
nnoremap <Ctrl-w>s <Ctrl-w>s<Ctrl-w>w
nnoremap <Ctrl-w>v <Ctrl-w>v<Ctrl-w>w
