vim9script

hi link Terminal Search
hi def link Floaterm       Normal
hi def link FloatermBorder NormalFloat

var winid: number = -1
var bufid: number = -1

def TerminalOpen(): void
		winid = popup_create(bufid, 
		{
				minwidth: 140,
				minheight: 28,
				maxwidth: 140,
				maxhegiht: 28,
				highlight:  'Floaterm',
				borderhighlight: ['FloatermBorder'],
				border: [1, 1, 1, 1],
				borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└']
		})
		setwinvar(winid, '&wincolor', 'Floaterm')
enddef

def TerminalClose(): void
	popup_close(winid)
enddef

export def TerminalToggle(): void
	if !bufexists(bufid)
		bufid = term_start(&shell, {hidden: 1, term_kill: 'kill', term_finish: 'close'})
	endif

	if empty(getwininfo(winid))
		TerminalOpen()
	else
		TerminalClose()
	endif
enddef

export def TerminalAutoClose(): void
	if !empty(getwininfo(winid))
		TerminalClose()
	endif
enddef
