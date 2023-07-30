local lsp = require("lsp-zero").preset({
	-- float_border = 'rounded',
	-- configure_diagnostics = true,
	-- setup_servers_on_start = true,
	set_lsp_keymaps = {
		preserve_mappings = false,
	},
	name = "recommended",
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	local opts = {
		buffer = bufnr,
	}
	lsp.default_keymaps(opts)
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
end)

lsp.setup()

require("null-ls").setup()

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	handlers = {},
})

-- You need to setup `cmp` after lsp-zero
local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()
-- local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	severity_sort = true,
-- 	float = {
-- 		border = "rounded",
-- 		source = "always",
-- 	},
-- })
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = {
			max_height = 15,
			max_width = 60,
		},
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
-- cmp.setup({
--         preselect = 'item',
--        completion = {
--            completeopt = "menu", "menuone", "noselect"
--        },
-- sources = {
-- 	{ name = "nvim_lsp" },
-- },
-- snippet = {
-- 	-- REQUIRED - you must specify a snippet engine
-- 	expand = function(args)
-- 		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 		require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
-- 		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
-- 		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 	end,
-- },
-- window = {
-- 	completion = cmp.config.window.bordered(),
-- 	documentation = {
-- 		max_height = 15,
-- 		max_width = 60,
-- 	},
-- },
-- mapping = {
-- 	-- `Enter` key to confirm completion
-- 	["<CR>"] = cmp.mapping.confirm({ select = false }),
--
-- 	-- Ctrl+E to abort
-- 	["<C-e>"] = cmp.mapping.abort(),
-- 	-- Ctrl+Space to trigger completion menu
-- 	["<C-Space>"] = cmp.mapping.complete(),
--
-- 	-- Navigate between snippet placeholder
-- 	["<C-f>"] = cmp_action.luasnip_jump_forward(),
-- 	["<C-b>"] = cmp_action.luasnip_jump_backward(),
--
-- 	["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
-- 	["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
--
--                ['<Tab>'] = cmp_action.luasnip_supertab(),
--                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
-- },
-- formatting = {
-- 	fields = { "abbr", "menu", "kind" },
-- 	format = function(entry, item)
-- 		local short_name = {
-- 			nvim_lsp = "LSP",
-- 			nvim_lua = "nvim",
-- 		}
--
-- 		local menu_name = short_name[entry.source.name] or entry.source.name
--
-- 		item.menu = string.format("[%s]", menu_name)
-- 		return item
-- 	end,
-- },
-- })
