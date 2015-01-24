# vimrc.vim

An extension of vim-sensible plugin suitable for web-developers, and not only.

Plugins consists of two parts:

* [settings taken from vim-sensible plugin](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L12)
* [little less sensible defaults I find awesome](https://github.com/sheerun/vimrc/blob/master/autoload/vimrc.vim#L131)

I encourage you to read the source, it's heavily commented, each default explained.

## Installation

We recommend to use:

- Lightweight [vim-plug](https://github.com/junegunn/vim-plug) as plugin manager
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) for syntax highlighting

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

## License

The same terms as Vim itself. See `:help license`.
