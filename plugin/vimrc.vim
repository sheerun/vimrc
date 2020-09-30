" sensible.vim - Defaults everyone can agree on, with extras
" Maintainer:   Adam Stankiewicz <sheerun@sher.pl>

if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 'yes'
endif

"" Basics

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd') && !(exists("did_load_filetypes") && exists("did_indent_on"))
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Enable default theme if some other is not set
if !exists("g:colors_name")
  colorscheme default
endif

" Change default theme for lightline to match default for colorscheme
if !exists("g:lightline")
  let g:lightline = { 'colorscheme': 'powerlineish' }
end

" Also set better lightline layout
if !has_key(g:lightline, 'active')
  let g:lightline['active'] = {
  \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
  \   'right': [ [], [ 'gitbranch' ], [ 'filetype' ]]
  \ }
  let g:lightline['component'] = { 'filetype': '%{&filetype}' }
  let g:lightline['component_function'] = { 'gitbranch': 'fugitive#head' }
endif
