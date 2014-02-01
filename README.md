# vimrc.vim

This plugin serves as core foundation of sound vim configuration.

It'll make your `~/.vimrc` **the only** source of vim configuration.

It consist of two parts:

* [settings taken from vim-sensible plugin](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L12)
* [little less sensible defaults I find awesome](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L131)

It comes with [NeoBundle](https://github.com/Shougo/neobundle.vim) for managing your Vim plugins.

It also uses [vim-polyglot](https://github.com/sheerun/vim-polyglot) for solid syntax support.

I encourage you to read the source, it's heavily commented, each default explained.

## Installation

This plugin is meant to automatically manage your `~/.vim` directory,
so you need to backup somewhere your current one directory, and issue:

  ```
  git clone --recursive https://github.com/sheerun/vimrc.git ~/.vim
  ```

## Sample `.vimrc`

  ```vim
  " Select your Leader key
  let mapleader = "\<Space>"

  " Load sensible defaults and setup NeoBundle
  call vimrc#before()

  " Define plugins you use
  NeoBundle 'kien/ctrlp.vim'

  " Define your vim configuration
  map q: :q

  " Load plugins
  call vimrc#after()

  " Define maps for your plugins
  map q: :q
  ```

## License

The same terms as Vim itself. See `:help license`.
