vim9script

if exists('g:floatermvim') || &cp
	finish
endif
g:floatermvim = 1

import autoload 'floaterm.vim'

command! -nargs=0 FloatermToggle  call floaterm.TerminalToggle()
