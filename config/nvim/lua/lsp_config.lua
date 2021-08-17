
-- vim.lsp.set_log_level("debug")
--https://raw.githubusercontent.com/kabouzeid/dotfiles/master/nvim/lua/lsp-settings.lua



-- Configure yaml language server for neovim development
local yaml_settings = {
  yaml = {
    customTags = {'!Equals', '!FindInMap sequence', '!GetAtt scalar', '!GetAZs scalar', '!ImportValue scalar', '!Join sequence scalar', '!Ref', '!Select sequence', '!Split sequence', '!Sub scalar', '!And sequence', '!Not sequence', '!Equals sequence', '!Sub sequence', '!ImportValue scalar', '!If sequence'
        },
    schemas = {'https://s3.amazonaws.com/cfn-resource-specifications-us-east-1-prod/schemas/2.15.0/all-spec.json'= '*-template.yaml'

        }
  },
}
-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "yaml" then
      config.settings = yaml_settings
    end
    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
end

