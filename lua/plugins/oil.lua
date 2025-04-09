return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      {
        '<leader>e',
        function()
          require('oil').open()
        end,
        desc = 'Open Oil',
      },
    },
    opts = {},
  },
}
