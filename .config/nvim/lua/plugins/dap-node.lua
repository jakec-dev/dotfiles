-- Additional DAP configurations for vitest projects
-- LazyVim's lang.typescript extra handles the adapter setup
-- This just adds vitest-specific launch configs

return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    -- Add vitest configs to existing TypeScript configurations
    for _, lang in ipairs({ "typescript", "typescriptreact" }) do
      -- Ensure the table exists (LazyVim should have created it)
      dap.configurations[lang] = dap.configurations[lang] or {}

      -- Append vitest-specific configurations
      vim.list_extend(dap.configurations[lang], {
        -- Debug current test file
        {
          type = "pwa-node",
          request = "launch",
          name = "Vitest: Debug Current File",
          program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
          args = { "run", "${relativeFile}", "--no-file-parallelism" },
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          env = { NODE_ENV = "test" },
        },
        -- Debug specific test by name pattern
        {
          type = "pwa-node",
          request = "launch",
          name = "Vitest: Debug by Pattern",
          program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
          args = function()
            local pattern = vim.fn.input("Test name pattern: ")
            return { "run", "${relativeFile}", "-t", pattern, "--no-file-parallelism" }
          end,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          env = { NODE_ENV = "test" },
        },
        -- Debug unit tests only
        {
          type = "pwa-node",
          request = "launch",
          name = "Vitest: Debug Unit Tests",
          program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
          args = { "run", "--project", "unit", "--no-file-parallelism" },
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          env = { NODE_ENV = "test" },
        },
      })
    end
  end,

  keys = {
    {
      "<leader>dT",
      function()
        local dap = require("dap")
        for _, config in ipairs(dap.configurations.typescript or {}) do
          if config.name == "Vitest: Debug Current File" then
            dap.run(config)
            return
          end
        end
        vim.notify("Vitest config not found", vim.log.levels.ERROR)
      end,
      desc = "Debug Current Test File",
    },
  },
}
