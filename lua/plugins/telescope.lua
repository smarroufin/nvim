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
      },
    },
    keys = {
      -- search keys
      { '<leader>f', require('telescope.builtin').find_files, desc = 'Search [F]iles' },
      -- {
      --   '<leader>f',
      --   function()
      --     vim.fn.system('git rev-parse --is-inside-work-tree')
      --     local is_inside_work_tree = vim.v.shell_error == 0
      --
      --     if is_inside_work_tree then
      --       require('telescope.builtin').git_files({ show_untracked = true })
      --     else
      --       require('telescope.builtin').find_files()
      --     end
      --   end,
      --   desc = 'Search [F]iles',
      -- },
      { '<leader>s', require('telescope.builtin').live_grep, desc = '[S]earch text' }, -- requires ripgrep
      { '<leader>s', require('telescope.builtin').grep_string, desc = '[S]earch text', mode = 'v' }, -- requires ripgrep
      { '<leader>r', require('telescope.builtin').resume, desc = 'Search [R]esume' },
      -- beginner keys
      { '<leader>k', require('telescope.builtin').keymaps, desc = 'Search [K]eymaps' },
      {
        '<leader>n',
        function()
          require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Search [N]eovim files',
      },
      -- lsp keys
      { 'grd', require('telescope.builtin').lsp_definitions, desc = 'Goto [D]efinition' },
      { 'grr', require('telescope.builtin').lsp_references, desc = 'Goto [R]eferences' },
      { 'gri', require('telescope.builtin').lsp_implementations, desc = 'Goto [I]mplementation' },
      { 'gO', require('telescope.builtin').lsp_document_symbols, desc = 'Document Symbols' },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        extensions = {
          fzf = {},
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
    end,
  },
}
