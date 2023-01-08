vim9script

hi link Terminal Search
hi def link Floaterm       Normal
hi def link FloatermBorder NormalFloat

var winid: number = -1
var bufid: number = -1
var width: number = &columns / 2
var height: number = &lines / 2

def TerminalOpen(): void
		winid = popup_create(bufid, 
		{
				minwidth: width,
				maxwidth: width,
				minheight: height,
				maxheight: height,
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
	if bufexists(bufid) && job_status(term_getjob(bufid)) == "dead"
		execute("bdelete " .. bufid)
	endif

	if !bufexists(bufid)
		width = &columns / 2
		height = &lines / 2
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
