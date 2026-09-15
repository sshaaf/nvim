return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({})

    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>n", group = "File Explorer" },
      { "<leader>s", group = "Split Window" },
      { "<leader>t", group = "Tabs" },
      { "<leader>g", group = "Git" },
      { "<leader>c", group = "Code/Config" },
      { "<leader>x", group = "Diagnostics/Quickfix" },
      { "<leader>w", group = "Workspace" },
      { "<leader>r", group = "Rename/Replace" },
      { "<leader>b", group = "Buffer" },
    })

    vim.keymap.set("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Search all keybindings" })

    vim.keymap.set("n", "<leader><leader>", function()
      require("which-key").show({ global = false })
    end, { desc = "Show all keybindings" })
  end,
}
