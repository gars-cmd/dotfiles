if not pcall(require, "luasnip") then
  return
end

require('user.LuaSnip.all')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local ls = require('luasnip')

local M = {}

function M.expand_or_jump()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end

function M.jump_next()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end

function M.jump_prev()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end

function M.change_choice()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end

function M.reload_package(package_name)
	for module_name, _ in pairs(package.loaded) do
		if string.find(module_name, '^' .. package_name) then
			package.loaded[module_name] = nil
			require(module_name)
		end
	end
end

function M.refresh_snippets()
	ls.cleanup()
	M.reload_package('user.LuaSnip')
end

local set = vim.keymap.set

local insert = { 'i', 's' }
local normal = { 'n' }

set(insert, '<c-k>', M.expand_or_jump)
set(insert, '<c-j>', M.jump_prev)
set(insert, '<c-l>', M.change_choice)
set(normal, '<space><space>s', M.refresh_snippets)



