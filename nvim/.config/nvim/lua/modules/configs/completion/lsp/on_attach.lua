local M = {}

M.on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	-- Example keymap for listing workspace folders
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "Workspace List Folders")

	-- if client.server_capabilities.inlayHintProvider then
	-- 	vim.lsp.inlay_hint.enable(true)
	-- end
end

return M
