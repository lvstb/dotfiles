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

                customTags = {
                    "!fn",
                    "!And",
                    "!If",
                    "!Not",
                    "!Equals",
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
