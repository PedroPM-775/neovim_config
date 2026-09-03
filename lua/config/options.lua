-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.g.snacks_animate = true
-- lua/config/options.lua

-- 2. DESACTIVAR PROVIDERS EN DESUSO:
-- Evita los avisos de checkhealth y acelera el tiempo de arranque de Neovim
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
