# vimrc.vim

This plugin replaces lion's share of my `.vimrc`. A superset of [`vim-sensible`](https://github.com/tpope/vim-sensible).

It consists of two, well documented parts:

* [vim-sensible defaults](#basics)
* [extra configuration](#extras)

## Installation

Just include with some package manager, like:

```
Plug 'sheerun/vimrc'
```

I recommend to use:

- [vim-plug](https://github.com/junegunn/vim-plug) as lightweight plugin manager
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) for syntax highlighting

Example for simple `.vimrc` file:

```vim
" Select your Leader key
let mapleader = "\<Space>"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
" Load other plugins

call plug#end()

" Define maps for your plugins
nnoremap <Leader>o :CtrlP<CR>
```

## Features

## Basics

* Disable strange Vi defaults.

  ```vim
  set nocompatible
  ```

* Turn on filetype plugins (:help filetype-plugin).

  ```vim
  if has('autocmd')
    filetype plugin indent on
  endif
  ```

* Enable syntax highlighting.

  ```vim
  if has('syntax')
    syntax enable
  endif
  ```

* Autoindent when starting new line, or using `o` or `O`.

  ```vim
  set autoindent
  ```

* Allow backspace in insert mode.

  ```vim
  set backspace=indent,eol,start
  ```

* Don't scan included files. The .tags file is more performant.

  ```vim
  set complete-=i
  ```

* Use 'shiftwidth' when using `<Tab>` in front of a line.
  By default it's used only for shift commands (`<`, `>`).

  ```vim
  set smarttab
  ```

* Disable octal format for number processing.

  ```vim
  set nrformats-=octal
  ```

* Allow for mappings including `Esc`, while preserving
  zero timeout after pressing it manually.

  ```vim
  set ttimeout
  set ttimeoutlen=100
  ```

* Enable highlighted case-insensitive incremential search.

  ```vim
  set incsearch
  ```

* Indent using two spaces.

  ```vim
  set tabstop=2
  set shiftwidth=2
  set expandtab
  ```

* Use `Ctrl-L` to clear the highlighting of :set hlsearch.

  ```vim
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  ```

* Always show window statuses, even if there's only one.

  ```vim
  set laststatus=2
  ```

* Show the line and column number of the cursor position.

  ```vim
  set ruler
  ```

* Show the size of block one selected in visual mode.

  ```vim
  set showcmd
  ```

* Autocomplete commands using nice menu in place of window status.
  Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.

  ```vim
  set wildmenu
  ```

* When 'wrap' is on, display last line even if it doesn't fit.

  ```vim
  set display+=lastline
  ```

* Force utf-8 encoding in GVim

  ```vim
  if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
  endif
  ```

* Set default whitespace characters when using `:set list`

  ```vim
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  ```

* Delete comment character when joining commented lines

  ```vim
  if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
  endif
  ```

* Search upwards for tags file instead only locally

  ```vim
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif
  ```

* Reload unchanged files automatically.

  ```vim
  set autoread
  ```

* Support all kind of EOLs by default.

  ```vim
  set fileformats+=mac
  ```

* Increase history size to 1000 items.

  ```vim
  set history=1000
  ```

* Allow for up to 50 opened tabs on Vim start.

  ```vim
  set tabpagemax=50
  ```

* Always save upper case variables to viminfo file.

  ```vim
  set viminfo^=!
  ```

* Enable backup and undo files by default.

  ```vim
  let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
  let &backupdir = expand(s:dir) . '/backup//'
  let &undodir = expand(s:dir) . '/undo//'
  set undofile
  ```

* Allow color schemes to do bright colors without forcing bold.

  ```vim
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif
  ```

* Load matchit.vim, but only if the user hasn't installed a newer version.

  ```vim
  if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
  endif
  ```

* `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo,
  so that you can undo `Ctrl-U` without undoing what you typed before it.

  ```vim
  inoremap <C-U> <C-G>u<C-U>
  ```

* Avoid problems with fish shell
  ([issue](https://github.com/tpope/vim-sensible/issues/50)).

  ```vim
  if &shell =~# 'fish$'
    set shell=/bin/bash
  endif
  ```

## Extras

* Set monako font if using macvim

  ```vim
  if has("gui_macvim")
    set guifont=Monaco:h13
  endif
  ```

* Keep flags when repeating last substitute command.

  ```vim
  nnoremap & :&&<CR>
  xnoremap & :&&<CR>
  ```

* Y yanks from the cursor to the end of line as expected. See :help Y.

  ```vim
  nnoremap Y y$
  ```

* Automatically create directories for backup and undo files.

  ```vim
  if !isdirectory(expand(s:dir))
    call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
  end
  ```

* Use more readable color scheme by default.
  It works well with `:set colorline` option.

  ```vim
  colorscheme wombat256mod
  ```

* Highlight line under cursor. It helps with navigation.

  ```vim
  set cursorline
  ```

* Keep 8 lines above or below the cursor when scrolling.

  ```vim
  set scrolloff=8
  ```

* Keep 15 columns next to the cursor when scrolling horizontally.

  ```vim
  set sidescroll=1
  set sidescrolloff=15
  ```

* Set minimum window size to 79x5.

  ```vim
  set winwidth=79
  set winheight=5
  set winminheight=5
  ```

* If opening buffer, search first in opened windows.

  ```vim
  set switchbuf=usetab
  ```

* Hide buffers instead of asking if to save them.

  ```vim
  set hidden
  ```

* Wrap lines by default

  ```vim
  set wrap linebreak
  set showbreak=" "
  ```

* Allow easy navigation between wrapped lines.

  ```vim
  vmap j gj
  vmap k gk
  nmap j gj
  nmap k gk
  ```

* For autocompletion, complete as much as you can.

  ```vim
  set wildmode=longest,full
  ```

* Show line numbers on the sidebar.

  ```vim
  set number
  ```

* Disable any annoying beeps on errors.

  ```vim
  set noerrorbells
  set visualbell
  ```

* Don't parse modelines (google "vim modeline vulnerability").

  ```vim
  set nomodeline
  ```

* Do not fold by default. But if, do it up to 3 levels.

  ```vim
  set foldmethod=indent
  set foldnestmax=3
  set nofoldenable
  ```

* Enable mouse for scrolling and window resizing.

  ```vim
  set mouse=a
  ```

* Disable swap to prevent annoying messages.

  ```vim
  set noswapfile
  ```

* Save up to 100 marks, enable capital marks.

  ```vim
  set viminfo='100,f1
  ```

* Enable search highlighting.

  ```vim
  set hlsearch
  ```

* Ignore case when searching.

  ```vim
  set ignorecase
  ```

* Show mode in statusbar, not separately.

  ```vim
  set noshowmode
  ```

* Don't ignore case when search has capital letter
  (although also don't ignore case by default).

  ```vim
  set smartcase
  ```

* Use dash as word separator.

  ```vim
  set iskeyword+=-
  ```

* Add gems.tags to files searched for tags.

  ```vim
  set tags+=gems.tags
  ```

* Disable output, vcs, archive, rails, temp and backup files.

  ```vim
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
  set wildignore+=*.swp,*~,._*
  ```

* Auto center on matched string.

  ```vim
  noremap n nzz
  noremap N Nzz
  ```

* Visually select the text that was last edited/pasted (Vimcast#26).

  ```vim
  noremap gV `[v`]
  ```

* Expand %% to path of current buffer in command mode.

  ```vim
  cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
  ```

* Enable saving by `Ctrl-s`

  ```vim
  nnoremap <C-s> :w<CR>
  inoremap <C-s> <ESC>:w<CR>
  ```

* Use Q to intelligently close a window
  (if there are multiple windows into the same buffer)
  or kill the buffer entirely if it's the last window looking into that buffer.

  ```vim
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
  ```

* Set window title by default.

  ```vim
  set title
  ```

* Always focus on splited window.

  ```vim
  nnoremap <C-w>s <C-w>s<C-w>w
  nnoremap <C-w>v <C-w>v<C-w>w
  ```

* Don't display the intro message on starting Vim.

  ```vim
  set shortmess+=I
  ```

* Use Silver Searcher for CtrlP plugin (if available)
  Fallback to git ls-files for fast listing.
  Because we use fast strategies, disable caching.

  ```vim
  let g:ctrlp_use_caching = 0
  if executable('ag')
      set grepprg=ag\ --nogroup\ --nocolor
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  else
    let g:ctrlp_user_command = ['.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f' ]
  ```

* Make sure pasting in visual mode doesn't replace paste buffer

  ```vim
  function! RestoreRegister()
    let @" = s:restore_reg
    return ''
  endfunction
  function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
  endfunction
  vmap <silent> <expr> p <sid>Repl()
  ```

* Prevent common mistake of pressing q: instead :q

  ```vim
  map q: :q
  ```

* Make a simple "search" text object.
  http://vim.wikia.com/wiki/Copy_or_change_search_hit
  It allows for replacing search matches with cs and then /././.

  ```vim
  vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
      \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
  omap s :normal vs<CR>
  ```

## License

The same terms as Vim itself. See `:help license`.
