require('vis')

vis.events.subscribe(vis.events.INIT, function()
	require('complete-filename')
	require('complete-word')
	require('base16-default-dark-ege')
	require('filetype')
    require('vis-ctags/ctags')

	vis:command('set autoindent on')
	vis:command('set expandtab on')
	vis:command('set tabwidth 4')
	vis:command('set escdelay 0')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)

end)
