vim9script

hi link Terminal Search
hi def link FloatermBorder NormalFloat

var buf = term_start(&shell, {hidden: 1, term_kill: 'kill', term_finish: 'close'})
var winid = -1

def g:Term()
	if winid > 0
		popup_close(winid)
		winid = -1
	else
		winid = popup_create(buf, 
		{
				minwidth: 140,
				minheight: 28,
				maxwidth: 140,
				maxhegiht: 28,
				borderhighlight: ['FloatermBorder'],
				border: [1, 1, 1, 1],
				borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└']
		})
		silent! execute 'normal! i'
	endif
enddef

command! -nargs=0 FloatermToggle  call Term()
tnoremap <C-_> <C-\><C-n>:FloatermToggle<CR>
noremap <C-_> :FloatermToggle<CR>
