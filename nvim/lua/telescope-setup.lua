local telescope = require('telescope')
local telescope_actions = require('telescope.actions')

telescope.setup {
	defaults = {
		preview = false,
		mappings = {
			n = {
				["l"] = telescope_actions.select_default,
				["left"] = telescope_actions.select_default
			}
		}
	},
	extensions = {
		file_browser = {
			grouped = true,
			sorting_strategy = 'ascending',
			initial_mode = 'normal',
			theme = "dropdown",
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

--telescope.load_extension('fzf')
