return {
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        function()
          vim.cmd.UndotreeToggle()
        end,
        desc = 'Open [U]ndoTree',
      },
    },
  },
}
