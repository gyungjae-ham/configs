return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons',
    'Mofiqul/dracula.nvim' -- 이 부분을 반드시 추가하세요!
  },
  config = function()
    require("lualine").setup({
      options = {
        -- 'dracula' 대신 'auto'를 쓰면 현재 colorscheme에 자동으로 맞춥니다.
        -- 하지만 확실하게 dracula를 지정하고 싶다면 아래처럼 하세요.
        theme = "dracula", 
        globalstatus = true, -- 하단 바를 하나로 통합 (요즘 트렌드)
      }
    })
  end,
}

