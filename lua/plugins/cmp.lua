return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    for _, source in ipairs(opts.sources or {}) do
      if source.name == "buffer" then
        source.option = source.option or {}
        source.option.get_bufnrs = function()
          local bufs = {}
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
              table.insert(bufs, buf)
            end
          end
          return bufs
        end
      end
    end
  end,
}
