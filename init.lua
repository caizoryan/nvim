-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false
vim.g.markdown_folding = 1

vim.g.run_ts = false
vim.o.termguicolors = true
vim.o.linespace = 5
vim.o.relativenumber = false
vim.o.number = false

vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

-- basic stuff
require 'mods.opts'
require 'mods.autocommands'
require 'main.lazy'
require 'mods.keymaps'
