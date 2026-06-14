-- ~/.config/nvim/lua/plugins/mason.lua

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Ensure list initialization safely
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        -- Python Tooling
        "pyright", -- Structural Type Checking
        "ruff", -- Ultra-fast Python Linting and Formatting

        -- Frontend & TypeScript Tooling
        "vtsls", -- Modernized, high-performance TypeScript LSP
        "prettier", -- Deterministic frontend formatter

        -- Shell & Utility Tooling
        "stylua", -- Lua formatter for your Neovim configs
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Enable pyright for type checking alongside ruff
        pyright = {},
        ruff = {},
        vtsls = {},
      },
      setup = {
        -- Configure ruff to cooperate perfectly with pyright hover actions
        ruff = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "ruff" then
              -- Disable hover in favor of Pyright's more detailed documentation
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
}
