-- assign a common leader button
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- NullLsInfo
vim.cmd("map <Leader>ln :NullLsInfo<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy and paste remap
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
	print("Formatted")
end)
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>R", "<cmd>e .config/nvim/lua/deancochran/packer.lua<CR>");

-- shout out current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd(":w")
end)

vim.keymap.set("n", "<leader>t", function()
	vim.cmd("tabnew")
	vim.cmd("Ex")
end)
vim.keymap.set("n", "<leader>]", function()
	vim.cmd("tabnext")
end)
vim.keymap.set("n", "<leader>[", function()
	vim.cmd("tabNext")
end)

vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>K", "<C-w>K")
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>L", "<C-w>L")

vim.keymap.set("n", "<leader>vs", function()
	vim.cmd("vsplit")
end)
vim.keymap.set("n", "<leader>hs", function()
	vim.cmd("split")
end)
