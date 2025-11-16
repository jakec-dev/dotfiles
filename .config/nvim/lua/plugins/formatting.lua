return {
  -- Configure conform.nvim to customize Prettier for JSONC files
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          -- Override Prettier options for specific file types
          options = {
            ft_parsers = {
              jsonc = "json",
            },
            -- Disable trailing commas for JSONC files
            ext_parsers = {
              jsonc = "json",
            },
          },
        },
      },
      formatters_by_ft = {
        jsonc = { "prettier" },
      },
    },
  },
}
