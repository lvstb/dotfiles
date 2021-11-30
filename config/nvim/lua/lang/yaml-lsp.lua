require'lspconfig'.yamlls.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
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
                    "!Equals Scalar",
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
                    "!Split sequence",
                    "!Join sequence"
                        },
                },
        },
    }
