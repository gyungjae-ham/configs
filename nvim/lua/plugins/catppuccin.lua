return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      background = {
        light = "latte",
        dark = "latte",
      },
      transparent_background = true,
      float = {
        transparent = true,
      },
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      integrations = {
        lualine = {},
        neotree = true,
        telescope = {
          enabled = true,
        },
      },
      custom_highlights = function()
        return {
          -- 터미널 배경이 그대로 보이도록 주요 창 배경을 비웁니다.
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          EndOfBuffer = { bg = "NONE" },
          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE" },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}
