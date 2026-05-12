return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "catppuccin/nvim", name = "catppuccin" },
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin-nvim",
        globalstatus = true,
      },
    })
  end,
}
