# Sheerun's sensible.vim 

Think of this plugin as step above `'nocompatible'` mode.

I am Ruby developer and this plugin is supposed to replace my `.vimrc` file.

Not everyone agreed on these settings. They just reflect my (rather good) taste.

## Installation

You can use [Vundle](https://github.com/gmarik/vundle) or [pathogen](https://github.com/tpope/vim-pathogen) for installation of this plugin.

You are supposed to fork this repository and source it at the top of `.vimrc`:

    runtime! plugin/sensible.vim

You can see [my dotfiles](https://github.com/sheerun/dotfiles) for nice & clean method of managing vim configuration.

## Features

* Enable Vim compatible mode.
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

* Don't scan included files. The .tags file is more performant.
  ```vim
  set complete-=i
  ```

* When inserting paren, jump briefly to matching one.
  ```vim
  set showmatch
  ```

* Autoindent when starting new line, or using `o` or `O`.
  ```vim
  set autoindent
  ```

* Round autoindentation. No one needs 3 spaces when you indent by two.
  ```vim
  set shiftround
  ```

* Indent using two spaces.
  ```vim
  set tabstop=2
  set backspace=2
  set shiftwidth=2
  set expandtab
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
  set ttimeoutlen=50
  ```

* Enable highlighted case-insensitive incremential search.
  ```vim
  set incsearch
  set hlsearch
  set ignorecase
  ```

* Don't ignore case when search has capital letters
  (although also don't ignore case by default).
  ```vim
  set smartcase
  ```

* Do not wrap lines.
  ```vim
  set nowrap
  ```

* Show line numbers on sidebar and statusbar.
  ```vim
  set number
  ```

* Don't ask if to safe buffers on close.
  ```vim
  set autowrite
  set hidden
  ```

* Disable anoying beeps on errors.
  ```vim
  set noerrorbells
  set visualbell
  ```

* Don't parse modelines (for security reasons).
  ```vim
  set nomodeline
  ```

* Disable auto folding on open.
  ```vim
  set nofoldenable
  ```

* Use <C-L> to clear the highlighting of :set hlsearch.
  ```vim
  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
  endif
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
  ```vim
  set wildmenu
  ```

* Keep one line above or below the cursor when scrolling.
  ```vim
  set scrolloff=1
  ```

* Keep 5 columns next to the cursor when scrolling horizontally.
  ```vim
  set sidescrolloff=5
  ```

* When 'wrap' is on, display last line even if it doesn't fit.
  ```vim
  set display+=lastline
  ```

* Show all whitespaces by default.
  ```vim
  set list
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
  ```

* Reload unchanged files automatically.
  ```vim
  set autoread
  ```

* Automatically save file as buffer goes away.
  ```vim
  set autowrite
  ```

* Support all kind of EOLs by default.
  ```vim
  set fileformats+=mac
  ```

* Always save upper case variables to viminfo file.
  ```vim
  set viminfo^=!
  ```

* Increase history size to 1000 items.
  ```vim
  set history=1000
  ```

* Enable mouse for scrolling and window resizing.
  ```vim
  set mouse=nicr
  ```

* For autocompletion, complete as much as you can.
  ```vim
  set wildmode=longest,full
  ```

* Disable output, vcs, archive, rails, temp and backup files.
  ```vim
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
  set wildignore+=*.swp,*~,._*
  ```

* Disable swap to prevent annoying messages.
  ```vim
  set noswapfile
  ```

* Create and set directories for backup and undo files.
  ```vim
  let s:dir = has('mac') ? '~/Library/Vim' : '~/.local/share/vim'
  if !isdirectory(expand(s:dir))
    call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
  end
  ```

* Allow color schemes to do bright colors without forcing bold.
  ```vim
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif
  ```

* Hide dotfiles, backup files and tag files by default.
  ```vim
  if !exists('g:netrw_list_hide')
    let g:netrw_list_hide = '^\.,\~$,^tags$'
  endif
  ```

* Load matchit.vim, but only if the user hasn't installed a newer version.
  ```vim
  if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
  endif
  ```

* Y yanks from the cursor to the end of line as expected. See :help Y.
  ```vim
  nnoremap Y y$
  ```

* Add gems.tags to files searched for tags.
  ```vim
  set tags+=gems.tags
  ```

See the [source](https://github.com/sheerun/vim-sensible) for the authoritative list of features.

## FAQ

> What's with these `.*.un~` files?

Basically, they make it so that you can undo things that happened in a
previous invocation of Vim.  See `:help undo-persistence` for details.  If you
don't like them strewn all over the file system, you have a few options.

1.  Create the appropriate directory that sensible.vim automatically configures for
    your platform:
    * `~/.local/share/vim/undo` on Linux
    * `~/Library/Vim/undo` on OS X
    * `~\Application Data\Vim\undo` on Windows
2.  Provide your own preferred location in `'undodir'`:
        set undodir^=~/.vim/undo//
3.  Disable them entirely:
        set noundofile

You can also just globally ignore them in your SCM of choice.  That's what I
do.

## License

The same terms as Vim itself. See `:help license`.
