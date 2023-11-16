local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })
-- Disable Python remote plugin
wilder.set_option('use_python_remote_plugin', 0)

local gradient = {
    '#d3869b', '#c27491', '#b16386', '#a0517c', '#8f3f71',
    '#fb4934', '#e43729', '#cc251d', '#b51212', '#9d0006',
    '#fabd2f', '#e9ab28', '#d89a22', '#c6881b', '#b57614',
    '#b8bb26', '#a8a920', '#99981a', '#898614', '#79740e',
}

for i, fg in ipairs(gradient) do
    gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
end

local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        winblend = 20,
        border = 'rounded',
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        -- }),
        highlights = {
            gradient = gradient, -- must be set
            -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
        },
        highlighter = wilder.highlighter_with_gradient({
            wilder.lua_fzy_highlighter(),
        }),
        left = {
            ' ',
            wilder.popupmenu_devicons(),
            wilder.popupmenu_buffer_flags({
                flags = ' A + ',
                icons = { ['+'] = 'modified', a = 'active', h = 'hidden', ['%'] = 'current  ', ['#'] = 'alternate' },
            }),
        },
        right = {
            ' ',
            wilder.popupmenu_scrollbar(),
        },
    })
)

local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = {
        wilder.lua_pcre2_highlighter(),
        wilder.lua_fzy_highlighter(),
    },
    separator = ' ¬∑ ',
    left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
})

wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = popupmenu_renderer,
    ['?'] = popupmenu_renderer,
    ['/'] = popupmenu_renderer,
    substitute = wildmenu_renderer
}))

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
        file_command = {'fd', '-tf'},
        dir_command = {'fd', '-td'},
        filter = {'fuzzy_filter', 'difflib_sorter'},
      --[[ fuzzy = 1, ]]
      --[[ fuzzy_filter = wilder.lua_fzy_filter(), ]]
    }),
    wilder.vim_search_pipeline()
  )
})
