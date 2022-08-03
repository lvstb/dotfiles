require("plugins")

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
vim.g.mapleader = ","

-- Move single row on wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")

 --Disable the mouse wheel
map("i", "<ScrollWheelUp>", "<Nop>")
map("i", "<ScrollWheelDown>", "<Nop>")

-- remap esc
map("i", "<esc>", "<Nop>")
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")

-- Open terminal below window
map("n", "<Leader>t", ":below 10sp term://$SHELL<cr>i", { noremap = true, silent = true})

-- Switch Session
map("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>")

-- Update Plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line moving
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

-- Telescope
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>fr", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>gr", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("n", "<space>fb", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>fs", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>fi", '<cmd>lua require("telescope.builtin").git_status()<cr>')
-- map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions( {layout_config={width=80, height=20} } ) <cr>')
-- map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
-- map("n", "<leader>di", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
-- map("n", "<leader>df", '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
-- map("n", "<leader>td", '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
map("n", "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<cr>')
map("n", "<C-x>", '<cmd>lua require("plugins.telescope").search_dotfiles( { hidden = true })<cr>')

-- Easier split mappings
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })
map("n", "<Leader>;", "<C-W>R", { silent = true })
map("n", "<Leader>[", "<C-W>_", { silent = true })
map("n", "<Leader>]", "<C-W>|", { silent = true })
map("n", "<Leader>=", "<C-W>=", { silent = true })

-- Hop
map("n", "m", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", ";", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "m", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", ";", "<cmd>lua require'hop'.hint_lines()<cr>")

-- Symbols outline
map("n", "<leader>o", ":SymbolsOutline<cr>")

-- Trouble keymaps
map("n", "<Leader>xx", "<cmd>Trouble<cr>", { noremap = true, silent = true})
map("n", "<Leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { noremap = true, silent = true})
map("n", "<Leader>xd", "<cmd>Trouble document_diagnostics<cr>", { noremap = true, silent = true})
map("n", "<Leader>xl", "<cmd>Trouble loclist<cr>", { noremap = true, silent = true})
map("n", "<Leader>xq", "<cmd>Trouble quicfix<cr>", { noremap = true, silent = true})
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { noremap = true, silent = true})
map("n", "gd", "<cmd>Trouble lsp_definitions<cr>", { noremap = true, silent = true})
map("n", "gi", "<cmd>Trouble lsp_implementations<cr>", { noremap = true, silent = true})
map("n", "gr", "<cmd>Trouble lsp_references<cr>", { noremap = true, silent = true})
map("n", "gt", "<cmd>Trouble lsp_type_definitions<cr>", { noremap = true, silent = true})
--LSP
map("n", "<Leader>rn", "<cmd>:lua vim.lsp.buf.rename()<cr>")
map("n", "gca", "<cmd>:lua vim.lsp.buf.code_action()<cr>")

-- Copy/Paste
map("v", "<Leader>c", "\"+y")
map("n", "<Leader>v", "\"+p")
