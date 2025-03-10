local wezterm = require('wezterm')

return {
	font		= wezterm.font('Fira Code'),
	font_size	= 13,
	line_height	= 1.0,

	colors = {
		background	= "#000000",
		foreground	= "#eaeaea",
		ansi		= {'#000000', '#d54e53', '#23d18b', '#e6c547', '#3b8eea', '#c397d8', '#70c0ba', '#e5e5e5'},
		brights		= {'#666666', '#ff3334', '#0dbc79', '#e7c547', '#2472c8', '#b77ee0', '#29b8db', '#e5e5e5'},
	},

	window_padding = {
		left	= 7,
		right	= 7,
		top	= 0,
		bottom	= 0,
	},
	window_background_opacity	= 0.75,
	text_background_opacity		= 1.0,
	window_decorations		= "TITLE | RESIZE",
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = true,

	enable_tab_bar			= true,
	hide_tab_bar_if_only_one_tab	= true,

	exit_behavior			= "Close",
	audible_bell= "Disabled",
	keys = {
		{ key = ' ', mods = 'SHIFT', action = wezterm.action.QuickSelect },
	},

	quick_select_patterns = {
		"((?:[A-Za-z0-9]+[\\.\\-_/])+[A-Za-z0-9\\.]+)",
	}
}

