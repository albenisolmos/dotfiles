local M = {}
local theme = require('telescope.themes').get_dropdown()

local function merge(...)
	local result = {}
	for _, t in ipairs{...} do
		for k, v in pairs(t) do
			result[k] = v
		end
	end
	return result
end

function M.find_git_files()
	local results = require('telescope.utils').get_os_command_output({'git', 'rev-parse', '--git-dir'})

	if results[1] then
		require('telescope.builtin').git_files(merge(
			{prompt_prefix = '  '}, theme))
	else
		require('telescope.builtin').find_files(merge(
			{theme = 'dropdown'}, theme))
	end
end

return M
