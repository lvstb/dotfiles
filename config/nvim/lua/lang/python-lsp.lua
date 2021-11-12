 require'lspconfig'.pyright.setup{
	 capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
-- require 'lspconfig'.pylsp.setup {
--     capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     settings = {
--         pylsp = {
--             plugins = {
--                 jedi_completion = {
--                     include_params = true,
--                 },
--             },
--         },
--     },
-- }
