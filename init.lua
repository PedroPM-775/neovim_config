-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.termguicolors = true
-- vim.cmd.colorscheme("pirum")
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- Asegurar que la ruta de site/ esté en el runtimepath de Neovim
vim.opt.rtp:append(vim.fn.stdpath("data") .. "/site")

