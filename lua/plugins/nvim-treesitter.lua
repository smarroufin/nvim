return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
          mode = 'cursor',
          max_lines = 3,
          multiline_threshold = 1,
        },
      },
    },
    opts = {
      ensure_installed = {
        'c',
        'css',
        'dockerfile',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'prisma',
        'query',
        'toml',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    main = 'nvim-treesitter.configs',
  },
}
