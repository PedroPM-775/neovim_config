return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Queremos que el tema cargue al principio
    priority = 1000, -- Prioridad alta para evitar parpadeos
    config = function()
      require('kanagawa').setup({
        -- Seleccionamos el estilo
        theme = "wave",
        -- Tu lógica de personalización
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- 1. Separadores de ventanas en BLANCO
            WinSeparator = { fg = "#ffffff", bg = "none" },
            VertSplit = { fg = "#ffffff", bg = "none" },

            -- 2. Tu configuración original de StatusLine
            StatusLine = { fg = theme.ui.fg_base, bg = theme.ui.bg_p1 },
            StatusLineNC = { fg = theme.ui.bg_p1, bg = "none" },

            -- 3. Tu configuración original de ventanas flotantes
            FloatBorder = { fg = theme.ui.bg_p1, bg = "none" },
            NormalFloat = { bg = "none" },
          }
        end,
      })

      -- Finalmente, cargar el esquema
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
