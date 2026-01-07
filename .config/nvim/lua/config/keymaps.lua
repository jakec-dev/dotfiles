-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DAP: Add watch expression (prompt for input)
vim.keymap.set("n", "<leader>dW", function()
  require("dapui").elements.watches.add()
end, { desc = "Add Watch" })

-- DAP: Watch visual selection
vim.keymap.set("v", "<leader>dW", function()
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))
  require("dapui").elements.watches.add(table.concat(lines, ""))
end, { desc = "Watch selection" })
