return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>c',
        function()
          require('conform').format()
        end,
        mode = 'n',
        desc = 'Format buffer with [C]onform',
      },
    },
    opts = {
      default_format_opts = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      format_on_save = {},
      -- FIXME: eslint
      formatters_by_ft = {
        -- javascript = { 'eslint_d' },
        -- javascriptreact = { 'eslint_d' },
        lua = { 'stylua' },
        -- typescript = { 'eslint_d' },
        -- typescriptreact = { 'eslint_d' },
      },
    },
  },
}
