"LSP config


"lua<< EOF
"require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}
"EOF
lua<< EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF


set completeopt=noinsert,noselect,menuone
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
