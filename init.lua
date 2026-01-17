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

-- basic stuff
require 'mods.opts'
require 'mods.keymaps'
require 'mods.autocommands'

require 'main.lazy'

-- Telescop commands
local builtin = require 'telescope.builtin'
local key = vim.keymap.set

key('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
key('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
key('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
key('n', '<C-f>', builtin.find_files, { desc = '[S]earch [F]iles' })

key('n', '<leader>fc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })
key('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
key('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
key('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
key('n', '<leader>fB', builtin.buffers, { desc = '[ ] Find existing buffers' })
key('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [B]uffer' })
key('n', '<leader>fg', builtin.git_files, { desc = '[S]earch [G]it files' })
