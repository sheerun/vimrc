# vimrc.vim

This plugin replaces lion's share of your `.vimrc`. A superset of [`vim-sensible`](https://github.com/tpope/vim-sensible).

## Installation

Just include with some package manager. For example if you use vim-plug, then write:

```
Plug 'sheerun/vimrc'
```

I recommend to use:

- Set your leader to space
- [vim-plug](https://github.com/junegunn/vim-plug) as lightweight plugin manager
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) for syntax highlighting

An example of simple `.vimrc` file:

```vim
" Select your Leader key
let mapleader = "\<Space>"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

call plug#end()
```

## Features

Every set default setting is documented in the source. You can read it [here](https://github.com/sheerun/vimrc/blob/master/ftdetect/vimrc.vim) and [here](https://github.com/sheerun/vimrc/blob/master/plugin/vimrc.vim)

## License

The same terms as Vim itself. See `:help license`.
