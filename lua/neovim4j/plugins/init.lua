return {
  -- Colorscheme
  { import = 'neovim4j.plugins.colorscheme' },

  -- Java plugin setup (includes LSP, DAP, and Completion)
  { import = 'neovim4j.plugins.java' },

  -- Rust plugin setup (includes LSP, DAP, and Completion)
  { import = 'neovim4j.plugins.rust' },

  -- Utility plugins
  "nvim-lua/plenary.nvim",
}
