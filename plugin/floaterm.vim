vim9script

if exists('g:floaterm') || &cp
	finish
endif
g:floaterm = 1

import autoload 'floaterm.vim'

command! -nargs=0 FloatermToggle  call floaterm.Term()
