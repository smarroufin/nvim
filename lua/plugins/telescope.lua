return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim', -- requires gcc & make
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      -- search
      { '<leader>f', require('telescope.builtin').find_files, desc = 'Search [F]iles' },
      {
        '<leader>F',
        function()
          require('telescope.builtin').find_files({ no_ignore = true, no_ignore_parent = true })
        end,
        desc = 'Search All [F]iles',
      },
      { '<leader>s', require('telescope.builtin').live_grep, desc = '[S]earch text' }, -- requires ripgrep
      { '<leader>s', require('telescope.builtin').grep_string, desc = '[S]earch text', mode = 'v' }, -- requires ripgrep
      { '<leader>r', require('telescope.builtin').resume, desc = 'Search [R]esume' },
      { '<leader>sb', require('telescope.builtin').buffers, desc = 'Search [B]uffers' },
      { '<leader>sk', require('telescope.builtin').keymaps, desc = 'Search [K]eymaps' },
      { '<leader>sh', require('telescope.builtin').help_tags, desc = 'Search [H]elp' },
      {
        '<leader>sn',
        function()
          require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Search [N]eovim files',
      },
      -- lsp
      { 'grd', require('telescope.builtin').lsp_definitions, desc = 'Goto [D]efinition' },
      { 'grr', require('telescope.builtin').lsp_references, desc = 'Goto [R]eferences' },
      { 'gri', require('telescope.builtin').lsp_implementations, desc = 'Goto [I]mplementation' },
      { 'gO', require('telescope.builtin').lsp_document_symbols, desc = 'Document Symbols' },
      -- git
      { '<leader>gs', require('telescope.builtin').git_status, desc = 'Git status' },
      { '<leader>gb', require('telescope.builtin').git_branches, desc = 'Git branches' },
      { '<leader>gc', require('telescope.builtin').git_commits, desc = 'Git commits' },
      { '<leader>gf', require('telescope.builtin').git_bcommits, desc = 'Git file commits' },
      { '<leader>gh', require('telescope.builtin').git_stash, desc = 'Git stash' },
      -- telescope
      { '<leader><leader>b', require('telescope.builtin').builtin, desc = 'Builtin' },
    },
    config = function()
      local telescope = require('telescope')
      local telescopeConfig = require('telescope.config')

      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, '--hidden')
      table.insert(vimgrep_arguments, '--glob=!**/.git/*')

      telescope.setup({
        defaults = {
          -- Ignore `.git/` folder in text grep commands
          vimgrep_arguments = vimgrep_arguments,
          layout_config = {
            horizontal = {
              width = 0.9,
              preview_cutoff = 100,
            },
          },
        },
        pickers = {
          find_files = {
            -- Ignore `.git/` folder
            find_command = { 'rg', '--files', '--hidden', '--glob=!**/.git/*' },
          },
        },
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
