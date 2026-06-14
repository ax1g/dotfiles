-- ~/.config/nvim/lua/plugins/ide.lua

return {
  -- 1. Python & FastAPI Ecosystem
  { import = "lazyvim.plugins.extras.lang.python" },

  -- 2. TypeScript & React Ecosystem
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- 3. Tailwind CSS Support (Highly recommended for modern React)
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  -- 4. Native Formatting override to ensure Prettier handles frontend files cleanly
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },
}
