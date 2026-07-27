return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- Modificamos la fuente 'buffer' para que lea TODOS los buffers abiertos
    for _, source in ipairs(opts.sources or {}) do
      if source.name == "buffer" then
        source.option = source.option or {}
        source.option.get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      end
    end
  end,
}
