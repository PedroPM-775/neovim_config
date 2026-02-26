return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require("luasnip")
      -- Esto carga los snippets genéricos (incluye Ruby) de friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Si quieres añadir uno tuyo rápido para probar:
      ls.add_snippets("ruby", {
        ls.snippet("rb_test", {
          ls.text_node("puts '¡Funcionan los snippets en Ruby viejo!'"),
        }),
      })
    end,
  },
}
