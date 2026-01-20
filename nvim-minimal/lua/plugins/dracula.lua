return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("dracula").setup({
      transparent = true,
      -- 추천 옵션 시작 --
      italic_comment = true,    -- 주석을 이탤릭체로 (코드 가독성 및 고급스러움 증가)
      show_end_of_buffer = true, -- 버퍼 끝 표시 (~ 표식)
      lualine_bg_color = "#44475a", -- Lualine(상태바) 배경색 강조
      
      -- 특정 요소의 색상을 수동으로 조정하여 더 컬러풀하게 만들기
      overrides = {
        -- 키워드(if, return 등)를 좀 더 튀는 핑크로 강조
        Keyword = { fg = "#ff79c6", italic = true, bold = true },
        -- 함수 이름을 밝은 시안색으로 강조
        Function = { fg = "#8be9fd", bold = true },
        -- 변수명을 주황색으로 더 뚜렷하게
        Identifier = { fg = "#ffb86c" },
        -- 주석을 좀 더 밝은 회색으로 (기본값은 너무 어두울 수 있음)
        Comment = { fg = "#6272a4", italic = true },
      },
      -- 추천 옵션 끝 --
    })
    vim.cmd[[colorscheme dracula]]
  end
}

