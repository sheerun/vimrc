# vimrc.vim

This plugin replaces the lion's share of my `.vimrc`. It includes:

* [`vim-sensible`](https://github.com/tpope/vim-sensible) defaults
* [carefully selected defaults](https://github.com/sheerun/vimrc.vim/blob/master/plugin/vimrc.vim#L127) similar to [janus](https://github.com/carlhuda/janus)' settings.vim

## Installation

Backup somewhere your current `~/.vim` directory, and:

```
git clone https://github.com/sheerun/vimrc.git ~/.vim
```

Your `.vimrc` should have following format:

```vim
call vimrc#before()

" Your code here. For example:
NeoBundle 'sheerun/vim-polyglot'

call vimrc#after()
```

## Features

* [compatible with vim-sensible](https://github.com/sheerun/vimrc.vim/blob/master/plugin/vimrc.vim#L5)

## License

The same terms as Vim itself. See `:help license`.
