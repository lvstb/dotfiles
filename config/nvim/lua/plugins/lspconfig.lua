local lspconfig = require "lspconfig"

require("mason").setup {
  -- ui = {
  --   icons = {
  --     package_installed = icons.server_installed,
  --     package_pending = icons.server_pending,
  --     package_uninstalled = icons.server_uninstalled,
  --   },
  }

require("mason-tool-installer").setup {
   ensure_installed = {
    -- lsp
    'lua-language-server',
    'vim-language-server',
    'yaml-language-server',
    'json-lsp',
    'bash-language-server',
    'typescript-language-server',

    -- formatting
    'prettierd',
    'shfmt',
    'stylua',
    'black',
    'eslint_d',

    -- diagnostics
    'markdownlint',
    'shellcheck',
    'write-good',
    'yamllint',
    'hadolint',
    'cfn-lint',
    },
    auto_update = true,
    run_on_start = true,
  }

require("mason-lspconfig").setup_handlers({
 function(server)
      local opts = {
           on_attach = require("plugins.lsp.handlers").on_attach,
           capabilities = require("plugins.lsp.handlers").capabilities,
      }
      require("lspconfig")[server].setup(opts)

      require("typescript").setup({
      server = {
          on_attach = opts.on_attach,
          capabilities = opts.capabilities
      }
     })

      if server == "sumneko_lua" then
           local sumneko_opts = require("plugins.lsp.settings.sumneko")
           sumneko_opts["on_attach"] = opts.on_attach
           sumneko_opts["capabilities"] = opts.capabilities
           require("lspconfig")[server].setup(sumneko_opts)
      end

      if server == "yamlls" then
           local yamlls_opts = require("plugins.lsp.settings.yamlls")
           yamlls_opts["on_attach"] = opts.on_attach
           yamlls_opts["capabilities"] = opts.capabilities
           require("lspconfig")[server].setup(yamlls_opts)
      end

      if server == "jsonls" then
           local jsonls_opts = require("plugins.lsp.settings.jsonls")
           jsonls_opts["on_attach"] = opts.on_attach
           jsonls_opts["capabilities"] = opts.capabilities
           require("lspconfig")[server].setup(jsonls_opts)
      end

 end})

require("mason-lspconfig").setup {
    automatic_installation = false,
}
