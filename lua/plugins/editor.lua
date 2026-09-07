return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      for _, source in ipairs(opts.sources or {}) do
        if source.name == "buffer" then
          source.option = source.option or {}
          source.option.get_bufnrs = function()
            return vim.tbl_filter(function(buf)
              return vim.api.nvim_buf_is_loaded(buf)
            end, vim.api.nvim_list_bufs())
          end
        end
      end
    end,
  },
}
