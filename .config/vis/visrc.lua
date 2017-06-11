require('vis')

vis.events.subscribe(vis.events.INIT, function()
	require('complete-filename')
	require('complete-word')
	require('solarized')
	require('filetype')

	vis:command('set autoindent on')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)

end)
