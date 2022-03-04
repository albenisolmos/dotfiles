local servers = {'clangd', 'pyright', 'tsserver'}

require('cmp-setup')
require('lsp-setup')(servers)
require('nvim-tree').setup {
	filters = {
		dotfiles = true
	}
}
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
