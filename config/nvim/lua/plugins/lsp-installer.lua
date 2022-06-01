local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
            },
        }
	end

    if server.name == "yamlls" then
    opts.settings = {
            yaml = {
                format = {
                        enable = true,
                },
                hover = true,
                completion = true,
                validate = true,
                customTags = {
                    "!fn",
                    "!And",
                    "!If",
                    "!If Sequence",
                    "!Not",
                    "!Equals",
                    "!Equals Scalar",
                    "!Equals sequence",
                    "!Or",
                    "!FindInMap sequence",
                    "!Base64",
                    "!Cidr",
                    "!Ref",
                    "!Ref Scalar",
                    "!Sub",
                    "!GetAtt",
                    "!GetAZs",
                    "!ImportValue",
                    "!Select",
                    "!Split",
                    "!Join sequence"
                    },
                schemaStore = {
                    url = "https://www.schemastore.org/api/json/catalog.json",
                    enable = true,
                },
                schemas = {
                    ["https://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.ya?ml",
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*cf*.ya?ml",
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.ya?ml",
                    ["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.ya?ml",
                    ["https://json.schemastore.org/eslintrc.json"] = ".eslintrc.ya?ml",
                    ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.ya?ml",
                    ["https://yarnpkg.com/configuration/yarnrc.json"] = ".yarnrc.ya?ml",
                    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.ya?ml",
                },
            },
        }
	end

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
