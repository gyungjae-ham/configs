local servers = {
  -- Kotlin
  "kotlin_language_server",

  -- Axum / Rust
  "rust_analyzer",

  -- Django / Python
  "pyright",
  "ruff",

  -- React / NestJS / TypeScript / JavaScript
  "ts_ls",
  "eslint",
  "html",
  "cssls",
  "jsonls",
  "tailwindcss",
  "emmet_language_server",

  -- Spring Boot / Java
  "jdtls",
  "gradle_ls",
  "yamlls",

  -- Neovim Lua config
  "lua_ls",
}

local function project_python_path()
  local cwd = vim.fn.getcwd()
  local root = vim.fs.root(cwd, { "pyproject.toml", "uv.lock", ".git" }) or cwd
  local venv_python = root .. "/.venv/bin/python"

  if vim.fn.executable(venv_python) == 1 then
    return venv_python
  end

  if vim.env.VIRTUAL_ENV then
    local active_venv_python = vim.env.VIRTUAL_ENV .. "/bin/python"
    if vim.fn.executable(active_venv_python) == 1 then
      return active_venv_python
    end
  end

  return "python3"
end

local function configure_spring_boot_tools()
  local data_path = vim.fn.stdpath("data")
  local jar = vim.fn.glob(data_path .. "/mason/packages/vscode-spring-boot-tools/extension/language-server/spring-boot-language-server-*-exec.jar")

  if vim.fn.filereadable(jar) ~= 1 then
    return
  end

  vim.lsp.config("spring_boot_tools", {
    cmd = { "java", "-jar", jar },
    filetypes = { "java", "yaml", "yml", "properties" },
    root_markers = {
      "pom.xml",
      "build.gradle",
      "build.gradle.kts",
      "settings.gradle",
      "settings.gradle.kts",
      ".git",
    },
  })
  vim.lsp.enable("spring_boot_tools")
end

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = { spacing = 2 },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>b", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>u", vim.lsp.buf.references, opts)
          vim.keymap.set({ "n", "v" }, "<leader><CR>", vim.lsp.buf.code_action, opts)
          vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>L", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            pythonPath = project_python_path(),
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              extraPaths = { "." },
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("ruff", {
        init_options = {
          settings = {
            args = {},
          },
        },
      })

      vim.lsp.config("html", {
        filetypes = { "html", "templ", "htmldjango", "django-html" },
      })

      vim.lsp.config("emmet_language_server", {
        filetypes = {
          "css",
          "html",
          "htmldjango",
          "django-html",
          "javascriptreact",
          "typescriptreact",
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      configure_spring_boot_tools()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = servers,
      automatic_enable = servers,
    },
  },
}
