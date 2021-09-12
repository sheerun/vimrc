" sensible.vim - Defaults everyone can agree on, with extras
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>

if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 'yes'
endif

" Set mapleader to space by default, early so all mappings by plugins are set
if !exists("mapleader")
  let mapleader = "\<Space>"
endif

" Disable strange Vi defaults.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"" Basics (from vim-sensible)

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Don't scan included files. The .tags file is more performant.
set complete-=i

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
" (only vim needs a fix for this)
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Enable highlighted case-insensitive incremential search.
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Always show window statuses, even if there's only one.
set laststatus=2

" Show the line and column number of the cursor position.
set ruler

" Autocomplete commands using nice menu in place of window status.
" Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.
set wildmenu

" Keep 5 columns next to the cursor when scrolling horizontally.
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" When 'wrap' is on, display last line even if it doesn't fit.
set display+=lastline

" Force utf-8 encoding
set encoding=utf-8

" Set default whitespace characters when using `:set list`
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Search upwards for tags file instead only locally
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Fix issues with fish shell
" https://github.com/tpope/vim-sensible/issues/50
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

" Reload unchanged files automatically.
set autoread

" Increase history size to 1000 items.
if &history < 1000
  set history=1000
endif

" Allow for up to 50 opened tabs on Vim start.
if &tabpagemax < 50
  set tabpagemax=50
endif

" Always save upper case variables to viminfo file.
if !empty(&viminfo)
  set viminfo^=!
endif

" Don't save options in sessions and views
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo,
" so that you can undo `Ctrl-U` without undoing what you typed before it.
if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif

if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"" Extras

" Improve displayed color if supported by terminal
if &t_Co >= 256
  set termguicolors
end

" Indent using two spaces.
if &tabstop == 8 && &shiftwidth == 8
  set tabstop=2
  set shiftwidth=2
endif

" Enable undofile and set undodir and backupdir
let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
let &backupdir = expand(s:dir) . '/backup//'
let &undodir = expand(s:dir) . '/undo//'
set undofile

" Automatically create directories for backup and undo files.
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end

" Set monako font if using macvim
if has("gui_macvim")
  set guifont=Monaco:h13
endif

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" Highlight line under cursor. It helps with navigation.
set cursorline
set cursorlineopt=number

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Show line numbers on the sidebar.
set number

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

" This is needed to avoid swapfile warning when auto-reloading
set shortmess+=A

" Avoids swapfiles in current directory
if &directory =~# '^\.,'
  if !empty($HOME)
    if has('win32')
      let &directory = expand('$HOME/vimfiles') . '//,' . &directory
    else
      let &directory = expand('$HOME/.vim') . '//,' . &directory
    endif
  endif
  if !empty($XDG_DATA_HOME)
    let &directory = expand('$XDG_DATA_HOME') . '//,' . &directory
  endif
  if has('macunix')
    let &directory = expand('$HOME/Library/Autosave Information') . '//,' . &directory
  endif
endif

" Save up to 100 marks, enable capital marks.
set viminfo='100,f1

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
set ignorecase

" Show mode in statusbar, not separately.
set noshowmode

" Don't ignore case when search has capital letter
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

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Set window title by default.
set title

" Always focus on splited window.
set splitright
set splitbelow

" Don't display the intro message on starting Vim.
set shortmess+=I

" Allow for easy copying and pasting
vnoremap <silent> y y`]
nnoremap <silent> p p`]

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Prevent common mistake of pressing q: instead :q
map q: :q

" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" It allows for replacing search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Disable writebackup because some tools have issues with it:
" https://github.com/neoclide/coc.nvim/issues/649
set nowritebackup

" Reduce updatetime from 4000 to 300 to avoid issues with coc.nvim
set updatetime=300

" Auto reload if file was changed somewhere else (for autoread)
au FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

" Merge signcolumn with number line (if supported)
if has("patch-8.1.1564")
  set signcolumn=number
endif

" Enable default theme if some other is not set
if !exists("g:colors_name")
  colorscheme default
endif

" Change default theme for lightline to match default for colorscheme
if !exists("g:lightline")
  let g:lightline = { 'colorscheme': 'powerlineish' }
end

" Also set better lightline layout
if !has_key(g:lightline, 'active')
  let g:lightline['active'] = {
        \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
        \   'right': [ [], [ 'gitbranch' ], [ 'filetype' ]]
        \ }
  let g:lightline['component'] = { 'filetype': '%{&filetype}' }
  let g:lightline['component_function'] = { 'gitbranch': 'fugitive#head' }
endif
