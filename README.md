# vimrc.vim

This plugin can replace the lion's share of your `.vimrc`.

## Installation

1. Backup somewhere your current `~/.vim` directory, and:

  ```
  git clone https://github.com/sheerun/vimrc.git ~/.vim
  ```

2. Your `.vimrc` should have following format:

  ```vim
  let mapleader = "\<space>"
  call vimrc#before()

  " Your code here. For example:
  NeoBundle 'kien/ctrlp.vim'

  call vimrc#after()
  ```

## Featuting

* [`vim-sensible`](https://github.com/tpope/vim-sensible) for sensible vim defaults
* [carefully selected defaults](https://github.com/sheerun/vimrc.vim/blob/master/plugin/vimrc.vim#L127) similar to [janus](https://github.com/carlhuda/janus)' settings.vim
* [`neobundle.vim`](https://github.com/Shougo/neobundle.vim) for package managing
* [`vim-polyglot`](https://github.com/sheerun/vim-polyglot) for performant language pack

## License

The same terms as Vim itself. See `:help license`.
