vim.g.autoformat = false

-- Tell kitty this window is an editor, so Ctrl-U / Ctrl-D stay editor motions.
local kitty_var = vim.api.nvim_create_augroup("KittyInEditor", { clear = true })

local function kitty_user_var(value)
  local seq = value and ("\x1b]1337;SetUserVar=in_editor=%s\x07"):format(value) or "\x1b]1337;SetUserVar=in_editor\x07"
  if vim.api.nvim_ui_send then
    vim.api.nvim_ui_send(seq)
  else
    io.stdout:write(seq)
    io.stdout:flush()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume", "UIEnter" }, {
  group = kitty_var,
  callback = function()
    kitty_user_var("MQ==")
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = kitty_var,
  callback = function()
    kitty_user_var(nil)
  end,
})
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.opt.softtabstop = 2
