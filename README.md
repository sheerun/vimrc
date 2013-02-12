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

See the [source][] for the authoritative list of features.

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
