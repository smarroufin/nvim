return {
  {
    'meeehdi-dev/bropilot.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'j-hui/fidget.nvim',
    },
    opts = {
      model = 'qwen2.5-coder:7b-base',
      auto_suggest = false,
      -- debounce is used even in auto_suggest false
      debounce = 1,
      keymap = {
        accept_word = '<C-l>',
        accept_line = '<C-M-l>',
        accept_block = '<Tab>',
        suggest = '<C-j>',
      },
    },
  },
}
