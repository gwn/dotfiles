-- Based on base16-vis (https://github.com/pshevtsov/base16-vis)
-- by Petr Shevtsov, modified by gwn
-- Default Dark scheme by Chris Kempson (http://chriskempson.com)

local lexers = vis.lexers

local colors = {
	['base00'] = '#181818',
	['base01'] = '#282828',
	['base02'] = '#383838',
	-- ['base03'] = '#585858',
	['base03'] = '#6d6d6d',
	['base04'] = '#b8b8b8',
	['base05'] = '#d8d8d8',
	['base06'] = '#e8e8e8',
	['base07'] = '#f8f8f8',
	['base08'] = '#ab4642',
	['base09'] = '#dc9656',
	['base0A'] = '#f7ca88',
	['base0B'] = '#a1b56c',
	['base0C'] = '#86c1b9',
	['base0D'] = '#7cafc2',
	['base0E'] = '#ba8baf',
	['base0F'] = '#a16946',
}

lexers.colors = colors

local fg = ',fore:'..colors.base05..','
local bg = ',back:'..colors.base00..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:'..colors.base0A
lexers.STYLE_COMMENT = 'fore:'..colors.base03..',italics'
lexers.STYLE_CONSTANT = 'fore:'..colors.base09
lexers.STYLE_DEFINITION = 'fore:'..colors.base0E
lexers.STYLE_ERROR = 'fore:'..colors.base08..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.base0D
lexers.STYLE_KEYWORD = 'fore:'..colors.base0E
lexers.STYLE_LABEL = 'fore:'..colors.base0A
lexers.STYLE_NUMBER = 'fore:'..colors.base09
lexers.STYLE_OPERATOR = 'fore:'..colors.base05
lexers.STYLE_REGEX = 'fore:'..colors.base0C
lexers.STYLE_STRING = 'fore:'..colors.base0B
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.base0A
lexers.STYLE_TAG = 'fore:'..colors.base0A
lexers.STYLE_TYPE = 'fore:'..colors.base0A
lexers.STYLE_VARIABLE = 'fore:'..colors.base0D
lexers.STYLE_WHITESPACE = 'fore:'..colors.base02
lexers.STYLE_EMBEDDED = 'fore:'..colors.base0F
-- lexers.STYLE_IDENTIFIER = 'fore:'..colors.base08
lexers.STYLE_IDENTIFIER = 'fore:'..colors.base05

lexers.STYLE_LINENUMBER = 'fore:'..colors.base02..',back:'..colors.base00
lexers.STYLE_CURSOR = 'fore:'..colors.base00..',back:'..colors.base05
lexers.STYLE_CURSOR_PRIMARY = 'fore:'..colors.base00..',back:'..colors.base05
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base01
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base01
lexers.STYLE_SELECTION = 'back:'..colors.base02
lexers.STYLE_STATUS = 'fore:'..colors.base04..',back:'..colors.base01
lexers.STYLE_STATUS_FOCUSED = 'fore:'..colors.base09..',back:'..colors.base01
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
