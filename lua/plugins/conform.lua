return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>c',
        function()
          require('conform').format()
        end,
        desc = 'Format buffer with [C]onform',
      },
    },
    opts = {
      default_format_opts = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
