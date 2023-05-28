local hop = require('hop')

hop.setup({keys = 'etovxqpdygfblzhckisuran'})

-- place this in one of your configuration file(s)

local directions = require('hop.hint').HintDirection

vim.keymap.set('n', ',w', hop.hint_words)

vim.keymap.set('', 'f', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true
    })
end, {remap = true})

vim.keymap.set('', 'F', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true
    })
end, {remap = true})

vim.keymap.set('', 't', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1
    })
end, {remap = true})

vim.keymap.set('', 'T', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1
    })
end, {remap = true})

