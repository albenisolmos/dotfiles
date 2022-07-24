local servers = {'clangd', 'pyright', 'tsserver'}

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
require('me.cmp')
require('me.lsp')(servers)
require('me.telescope')
