-- https://neovim.io/doc/user/options.html
-- [[ Global ]]
vim.g.mapleader = ' '

-- [[ Options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 2 -- The width of a TAB is set to 4. Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
vim.opt.shiftwidth = 2 -- Indents will have a width of 4
vim.opt.softtabstop = 2 -- Sets the number of columns for a TAB
vim.opt.expandtab = true -- Expand TABs to spaces
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.undofile = true -- Save file history for undotree
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Keymaps ]]
vim.keymap.set('n', '<Space>', '<Nop>', { desc = 'Unmap space' })
vim.keymap.set('n', '<Esc>', '<Esc>:noh<CR>', { desc = 'Clear highlights' })
-- Diagnostic
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅙',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰋼',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
  virtual_text = { current_line = true },
})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Diagnostic details' })
vim.keymap.set('n', '<leader>dk', function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>dj', function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = 'Next diagnostic' })
-- Window
vim.keymap.set('n', '<leader>w', '<C-w>')
-- Indent
vim.keymap.set('v', '<', '<gv', { desc = 'Keep visual selection after indent' })
vim.keymap.set('v', '>', '>gv', { desc = 'Keep visual selection after indent' })
-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Registers
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete without affecting register' })
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste without affecting register' })

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  change_detection = { notify = false },
})
