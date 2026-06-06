-- [[ Basic Keymaps ]]
local key = vim.keymap.set

key('n', 'j', 'gj')
key('n', 'k', 'gk')

--  See `:help hlsearch`
key('n', '<Esc>', '<cmd>nohlsearch<CR>')
key('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory' })

key('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory' })

-- Diagnostic keymaps
key('n', '<leader>c', '<CMD>bdelete<CR>', { desc = 'Close Current buffer' })
key('n', '<leader>q', '<CMD>close<CR>', { desc = 'Close Current window' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
key('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

key('n', '<leader>uc', '<CMD>colorscheme quiet<CR>')
key('n', '<leader>ul', '<CMD>colorscheme slate<CR>')
key('n', '<leader>ur', '<CMD>colorscheme randombones<CR>')

--  See `:help wincmd` for a list of all window commands
key('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
key('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
key('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
key('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

key('n', '<D-x>', ':')

local preview = false
local preview_mode = function()
  preview = true
  print('preview:', preview)

  vim.o.number = false
  vim.o.relativenumber = false
  vim.diagnostic.config {
    virtual_text = false,
    signs = false,
    underline = false,
  }
end

local reset_preview_mode = function()
  preview = false
  print('reset preview ->', preview)

  vim.o.number = true
  vim.o.relativenumber = true
  vim.diagnostic.config {
    virtual_text = true,
    signs = false,
    underline = true,
  }
end

local toggle_preview_mode = function()
  if preview then
    reset_preview_mode()
  else
    preview_mode()
  end
end

key('n', '<leader>pp', toggle_preview_mode, { desc = 'preview mode' })

-- ___________________
-- -------------------
-- Telescope commands
-- -------------------
-- ___________________

local builtin = require 'telescope.builtin'

key('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
key('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
key('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
key('n', '<C-f>', builtin.find_files, { desc = '[S]earch [F]iles' })
key('n', '<C-s>', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [F]iles' })
key('n', '<C-b>', builtin.buffers, { desc = '[S]earch [F]iles' })

key('n', '<leader>fc', builtin.colorscheme, { desc = '[S]earch [C]olorscheme' })
key('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
key('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
key('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
key('n', '<leader>fB', builtin.buffers, { desc = '[ ] Find existing buffers' })
key('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [B]uffer' })
key('n', '<leader>fg', builtin.git_files, { desc = '[S]earch [G]it files' })
key('n', '<leader>fu', '<cmd>Telescope undo<cr>')
