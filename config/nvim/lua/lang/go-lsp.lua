local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup {
    on_attach = on_attach,
    filetypes = {'go', 'gomod'},
    root_dir = function(fname)
        return nvim_lsp.util.root_pattern('go.mod', '.git')(fname) or
                   nvim_lsp.util.path.dirname(fname)
    end,
    settings = {
        gopls = {
            analyses = {unusedparams = true},
            staticcheck = true
        }
    }
}

vim.api.nvim_exec([[
    augroup GoImports
        autocmd BufWritePre *.go lua require"lsp.functions.go".organize_imports(1000)
    augroup END
]], true)
