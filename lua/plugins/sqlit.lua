return {
  {
    "Maxteabag/sqlit.nvim",
    cmd = "Sqlit",
    keys = {
      {
        "<leader>D",
        function()
          require("sqlit").open()
        end,
        desc = "Database (sqlit)",
      },
    },
    opts = {},
  },
}

