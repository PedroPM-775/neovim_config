return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Queremos que cargue al principio
    priority = 1000, -- Prioridad máxima
    opts = {
      compile = true, -- Compila el tema para que cargue más rápido
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- Ponlo en true si quieres que se vea el fondo de tu terminal
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      theme = "wave", -- Opciones: "wave", "dragon" (más oscuro), "lotus" (claro)
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
