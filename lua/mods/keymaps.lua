-- [[ Basic Keymaps ]]

--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Parent Directory' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>c', '<CMD>bdelete<CR>', { desc = 'Close Current buffer' })
vim.keymap.set('n', '<leader>q', '<CMD>close<CR>', { desc = 'Close Current window' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Harpoon keymaps
vim.keymap.set('n', '<leader>h', '<CMD>lua require("harpoon.mark").add_file()<CR><CMD>echo "mark added"<CR>', { desc = 'Add file to harpoon' })
vim.keymap.set('n', '<leader>ha', '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'Toggle harpoon menu' })

vim.keymap.set('n', '1', '<CMD>lua require("harpoon.ui").nav_file(1)<CR>')
vim.keymap.set('n', '2', '<CMD>lua require("harpoon.ui").nav_file(2)<CR>')
vim.keymap.set('n', '3', '<CMD>lua require("harpoon.ui").nav_file(3)<CR>')
vim.keymap.set('n', '4', '<CMD>lua require("harpoon.ui").nav_file(4)<CR>')
vim.keymap.set('n', '5', '<CMD>lua require("harpoon.ui").nav_file(5)<CR>')

vim.keymap.set('n', '<leader>uc', '<CMD>colorscheme quiet<CR>')
vim.keymap.set('n', '<leader>ul', '<CMD>colorscheme slate<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- copilot accept <C-l>
-- disable copilot tab
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-l>', "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true, replace_keycodes = false })

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

vim.keymap.set('n', '<leader>pp', toggle_preview_mode, { desc = 'preview mode' })
