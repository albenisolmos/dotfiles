local servers = {'clangd', 'pyright', 'tsserver'}

require('harpoon').setup {
	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_toggle = false,
	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,
	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,
	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,
	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon" },
	-- set marks specific to each git branch inside git repository
	mark_branch = false,
}

vim.diagnostic.config {
	virtual_text = false
}

require('nvim-treesitter.configs').setup {
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}

-- Large setups --
require('cmp-setup')
require('lsp-setup')(servers)

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
			initial_mode = 'normal',
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

telescope.load_extension('file_browser')
telescope.load_extension('fzf')
telescope.load_extension('harpoon')

require('utils')
