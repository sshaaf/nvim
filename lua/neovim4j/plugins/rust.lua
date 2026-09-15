return {
  -------------------------------------------
  -- Rustaceanvim - Primary Rust plugin
  -------------------------------------------
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp('codeAction')
          end, { desc = "Code Action", buffer = bufnr })

          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp('debuggables')
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = { enable = true },
            },
            checkOnSave = true,
            check = {
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
            files = {
              excludeDirs = {
                '.direnv', '.git', '.github', '.gitlab',
                'bin', 'node_modules', 'target', 'venv',
              },
            },
            semanticHighlighting = {
              strings = { enable = false },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable('rust-analyzer') == 0 then
        vim.notify(
          'rust-analyzer not found in PATH. Please install it.\nhttps://rust-analyzer.github.io/',
          vim.log.levels.WARN,
          { title = 'rustaceanvim' }
        )
      end
    end,
  },

  -------------------------------------------
  -- Crates.nvim - Cargo.toml support
  -------------------------------------------
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  -------------------------------------------
  -- Ensure rust-analyzer via Mason
  -------------------------------------------
  {
    'williamboman/mason-lspconfig.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'rust_analyzer' })
    end,
  },
}
