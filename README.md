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

* Don't configure if one requests vi-compatible mode.
* Turn on filetype plugins (:help filetype-plugin).
* Enable syntax highlighting.
* Don't scan included files. Tags file is more performant.
* When inserting paren, jump briefly to matching one.
* Autoindent when starting new line, or using "o" or "O".
* Round autoindentation. No one needs 3 spaces when you indent by two.
* Use 'shiftwidth' when using <Tab> in front of a line.
  By default it's used only for shift commands ("<", ">").
* Disable octal format for number processing.
* Allow for mappings including Esc, while preserving
  no timeout after pressing it manually.
* Enable incremential search.
* Don't ignore case when search has capital letters.
  (although also don't ignore case by default).
* Use <C-L> to clear the highlighting of :set hlsearch.
* Always show window statuses, even if there's only one.
* Show the line and column number of the cursor position.
* Show the size of block one selected in visual mode.
* Autocomplete commands using nice menu in place of window status.
* Keep one line above or below the cursor when scrolling.
* Keep 5 columns next to the cursor when scrolling horizontally.
* When 'wrap' is on, display last line even if it doesn't fit.
* Show all whitespaces by default.
* Reload unchanged files automatically.
* Automatically save file as buffer goes away.
* Support all kind of EOLs by default.
* Always save upper case variables to viminfo file.
* Increase history size to 1000 items.
* Allow color schemes to do bright colors without forcing bold.
* Hide dotfiles, backup files and tag files by default.
* Load matchit.vim, but only if the user hasn't installed a newer version.
* Y yanks from the cursor to the end of line as expected. See :help Y.

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
