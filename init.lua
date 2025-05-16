-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.run_ts = false
vim.o.termguicolors = true
vim.o.linespace = 5

vim.o.relativenumber = false
vim.o.number = false

vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

require 'mods.opts'
require 'mods.keymaps'
require 'mods.autocommands'

require('lazy').setup({
  require 'plugins.babies',
  require 'plugins.lazygit',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.treesitter',
}, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
