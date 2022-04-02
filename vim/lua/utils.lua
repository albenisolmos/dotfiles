local M = {}

function M.telescope_project_search()
	require('telescope.builtin').find_files {
		previewer = false,
		shorten_path = true,
		layout_strategy = "horizontal",
		cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
	}
end

return M