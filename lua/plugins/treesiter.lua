return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Definir la ruta del directorio site y asegurarla en el runtimepath de Lazy
      local parser_dir = vim.fn.stdpath("data") .. "/site"
      opts.parser_install_dir = parser_dir
      vim.opt.rtp:append(parser_dir)

      -- Parsers asegurados para tu entorno de desarrollo
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "ruby",              -- Sintaxis principal de Ruby
          "embedded_template", -- Para plantillas .html.erb (eRuby)
          "html",              -- HTML en vistas
          "css",               -- Hojas de estilo
          "javascript",        -- JS en vistas/assets
          "yaml",              -- Configuración de Rails (database.yml, etc.)
          "sql",               -- Esquema y consultas a BD
          "json",
          "markdown",
        })
      end
    end,
  },
}
