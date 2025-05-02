return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    enabled = true,
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
      },
      fuzzy = {
        sorts = {
          'exact',
          -- defaults
          'score',
          'sort_text',
        },
      },
      sources = {
        providers = {
          snippets = {
            opts = {
              global_snippets = { 'package' },
            },
          },
        },
      },
      signature = { enabled = true },
    },
  },
}
