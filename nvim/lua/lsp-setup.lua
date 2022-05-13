local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
		vim.lsp.protocol.make_client_capabilities())
local opts = { noremap = true, silent = true } -- Mappings.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Setup lspconfig.
local function on_attach(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', 'Lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'LH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'Lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'Lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', 'dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

return function(servers)
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup {
			autostart = false,
			on_attach = on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			}
		}
	end

	lspconfig.sumneko_lua.setup {
		on_attach = on_attach,
		autostart = false,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		cmd = {
			vim.env.HOME .. '/Downloads/software/lua-language-server/bin/lua-language-server'
			--sumneko_binary --, "-E", lsp_install_dir .. '/sumneko_lua/extension/server' .. "/main.lua"
		},
		settings = {
			Lua = {
				runtime = {
					version = '5.3',
					path = runtime_path,
				},
				diagnostics = {
					virtual_text = false,
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = { enable = true }
			}
		}
	}
end
