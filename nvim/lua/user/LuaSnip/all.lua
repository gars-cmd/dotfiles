local ls = require "luasnip"
local fmt = require ("luasnip.extras.fmt").fmt
local r = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

ls.add_snippets('all', {
    s('test', fmt('local {} = {}', {
            i(1, "varName"),
            i(2, "value")
        }))
})


ls.add_snippets('all', {
    s('ii', fmt('{} {} {}',{
        i(2, {'line one ', 'line two'}),
        i(1, {'111'}),
        f(function (values)
            vim.print(values)
            return 'test'
        end, {})
    }))
})

local func_template  = [[
    -- {} {}
function {}({})
    {}
end
]]

ls.add_snippets('all', {
    s('dynamic', fmt(func_template, {
        i(1, 'comment_val'),
        f(function (values)
            print(values)
        end, {}),
        i(2, 'func_name'),
        i(3, 'param_name'),
        i(4, 'func_body'),
    }))
})

-- stop at the video number 6 of the playlist luasnip zero to hero at 6:00










ls.add_snippets('all', {
    s('c', c(1, { -- make possible to choose for a node different possibiity
        t('1st'),
        t('2nd'),
        t('3rd'),
    }))
})

ls.add_snippets('all', {
    s('d', c(1, {
        fmt('local {} = {} ', {
            i(1, 'name'),
            i(2, 'value'),
        }),
        fmt('{} = {}', {
            i(1, 'name'),
            i(2, 'value'),
        })
    }))
})

ls.add_snippets('lua' , {
    s('dateo', f(function ()
        return os.date('%Y-%m-%d')
    end))
})



