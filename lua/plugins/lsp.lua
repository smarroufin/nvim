-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/configs
local servers = {
  eslint = {
    settings = {
      codeActionOnSave = {
        enable = true, -- If not enabled, eslint LSP won't respond to "source.fixAll" requests
      },
      format = {
        enable = true, -- If not enabled, eslint LSP won't respond to document formatting requests
      },
      workingDirectories = {
        mode = 'auto',
      },
    },
  },
  html = {
    settings = {
      html = {
        format = {
          wrapLineLength = 0,
        },
      },
    },
  },
  ts_ls = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
    },
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server'),
          languages = { 'vue' },
        },
      },
    },
  },
  volar = {
    settings = {
      html = {
        format = {
          enable = false, -- Disabled to avoid conflicts with eslint stylistic rules
        },
      },
    },
  },
}

local function setup_server(server_name)
  local server = servers[server_name] or {}
  server.capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    -- require('cmp_nvim_lsp').default_capabilities(),
    require('blink.cmp').get_lsp_capabilities(),
    server.capabilities or {}
  )
  -- server.on_attach = function(client, bufnr)
  --   vim.print(client.name)
  -- end
  require('lspconfig')[server_name].setup(server)
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = { 'Mason' },
        opts = {},
      },
      'williamboman/mason-lspconfig.nvim',
      -- 'hrsh7th/cmp-nvim-lsp',
      'saghen/blink.cmp',
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = { setup_server },
      })
    end,
  },
}
