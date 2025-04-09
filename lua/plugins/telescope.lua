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
      { 'gd', require('telescope.builtin').lsp_definitions, desc = '[G]oto [D]efinition' },
      { 'gr', require('telescope.builtin').lsp_references, desc = '[G]oto [R]eferences' },
      { 'gi', require('telescope.builtin').lsp_implementations, desc = '[G]oto [I]mplementation' },
      { '<leader>ds', require('telescope.builtin').lsp_document_symbols, desc = '[D]ocument [S]ymbols' },
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
    end,
  },
}
