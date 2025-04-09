return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim', -- requires gcc & make
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
      },
      {
        'nvim-treesitter/nvim-treesitter',
      },
      {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font,
      },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = 'Search [K]eymaps' })
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search [F]iles' })
      vim.keymap.set('n', '<leader>r', builtin.resume, { desc = 'Search [R]esume' })
      vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = '[S]earch text' }) -- requires ripgrep
      vim.keymap.set('v', '<leader>s', builtin.grep_string, { desc = '[S]earch text' }) -- requires ripgrep
      vim.keymap.set('n', '<leader>n', function()
        builtin.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = 'Search [N]eovim files' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },
}
