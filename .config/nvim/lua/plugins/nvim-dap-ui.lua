return {
  "rcarriga/nvim-dap-ui",
  opts = {
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.75 },
          { id = "repl", size = 0.25 },
        },
        size = 10,
        position = "bottom",
      },
      -- {
      --   elements = {
      --     { id = "watches", size = 0.5 },
      --   },
      --   position = "left",
      --   size = 32,
      -- },
    },
  },
}
