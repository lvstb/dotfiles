M = {}
M.on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- nmap("<leader>r", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
	-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "Workspace List Folders")
end

return M
