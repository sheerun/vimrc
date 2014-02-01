# vimrc.vim

This plugin serves as core foundation of sound vim configuration.

It'll make your `~/.vimrc` **the only** source of vim configuration.

It consist of two parts:

* [settings taken from vim-sensible plugin](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L12)
* [little less sensible defaults I find awesome](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L131)

Vimrc.vim comes with [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage your Vim plugins.

It also uses [vim-polyglot](https://github.com/sheerun/vim-polyglot) for solid syntax support.

I encourage you to read the source, it's heavily commented, each default explained.

## Installation

1. Backup somewhere your current `~/.vim` directory, and issue:

  ```
  git clone --recursive https://github.com/sheerun/vimrc.git ~/.vim
  ```

## Sample `.vimrc`

  ```vim
  let mapleader = "\<Space>"
  call vimrc#before()

  " Your bundles and settings here. For example:
  NeoBundle 'kien/ctrlp.vim'

  call vimrc#after()
  ```

## License

The same terms as Vim itself. See `:help license`.
