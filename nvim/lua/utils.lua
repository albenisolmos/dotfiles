local M = {}

function M.telescope_project_search()
	require('telescope.builtin').find_files {
		previewer = false,
		shorten_path = true,
		layout_strategy = "horizontal",
		cwd = require("plenary.job"):new({
			command = "git",
			args = { "rev-parse", "--show-toplevel" }
		}):sync()[1]
	}
end

return M
