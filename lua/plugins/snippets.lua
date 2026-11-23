return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      local ls = require("luasnip")
      ls.filetype_extend("ruby", { "rails" })
      ls.filetype_extend("eruby", { "rails" })
      return opts
    end,
  },
}
