" sensible.vim - Defaults everyone can agree on, with extras
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>

if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 'yes'
endif

"" Basics

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  if !exists("did_load_filetypes")
    filetype plugin on
  endif

  if !exists("did_indent_on")
    filetype indent on
  endif
endif

" Enable syntax highlighting.
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if !exists("g:colors_name")
  colorscheme default
endif

if !exists("g:lightline")
  let g:lightline = { 'colorscheme': 'powerlineish' }
end

if !has_key(g:lightline, 'active')
  let g:lightline['active'] = {
  \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
  \   'right': [ [], [ 'gitbranch' ], [ 'filetype' ]]
  \ }
  let g:lightline['component'] = { 'filetype': '%{&filetype}' }
  let g:lightline['component_function'] = { 'gitbranch': 'fugitive#head' }
endif
