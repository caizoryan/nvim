-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.run_ts = false

require 'mods.opts'
require 'mods.keymaps'
require 'mods.autocommands'

require('lazy').setup({
  require 'plugins.babies',
  require 'plugins.lazygit',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.treesitter',

  { -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'tokyonight-moon'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
