vim9script

hi link Terminal Search

var buf = term_start(&shell, {hidden: 1, term_kill: 'kill', term_finish: 'close'})
var winid = popup_create(buf, {minwidth: 50, minheight: 20})

def g:Term()
	if winid > 0
		popup_close(winid)
		winid = -1
	else
		winid = popup_create(buf, {minwidth: 50, minheight: 20})
		silent! execute 'normal! i'
	endif
enddef

command! -nargs=0 FloatermToggle  call Term()
tnoremap <C-_> <C-\><C-n>:FloatermToggle<CR>
noremap <C-_> :FloatermToggle<CR>
