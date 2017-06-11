-- Eight-color scheme
local lexers = vis.lexers
-- dark
lexers.STYLE_DEFAULT ='back:black,fore:white'
lexers.STYLE_NOTHING = 'back:black'
lexers.STYLE_CLASS = 'fore:yellow,bold'
lexers.STYLE_COMMENT = 'fore:blue,bold'
lexers.STYLE_CONSTANT = 'fore:cyan,bold'
lexers.STYLE_DEFINITION = 'fore:blue,bold'
lexers.STYLE_ERROR = 'fore:red,italics'
lexers.STYLE_FUNCTION = 'fore:blue,bold'
lexers.STYLE_KEYWORD = 'fore:yellow,bold'
lexers.STYLE_LABEL = 'fore:green,bold'
lexers.STYLE_NUMBER = 'fore:red,bold'
lexers.STYLE_OPERATOR = 'fore:cyan,bold'
lexers.STYLE_REGEX = 'fore:green,bold'
lexers.STYLE_STRING = 'fore:red,bold'
lexers.STYLE_PREPROCESSOR = 'fore:magenta,bold'
lexers.STYLE_TAG = 'fore:red,bold'
lexers.STYLE_TYPE = 'fore:green,bold'
lexers.STYLE_VARIABLE = 'fore:blue,bold'
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'back:blue,bold'
lexers.STYLE_IDENTIFIER = 'fore:white'

lexers.STYLE_LINENUMBER = 'fore:white'
lexers.STYLE_CURSOR = 'reverse'
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',fore:yellow'
lexers.STYLE_CURSOR_LINE = 'underlined'
lexers.STYLE_COLOR_COLUMN = 'back:red'
lexers.STYLE_SELECTION = 'back:white'
lexers.STYLE_STATUS = 'reverse'
lexers.STYLE_STATUS_FOCUSED = 'reverse,bold'
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
