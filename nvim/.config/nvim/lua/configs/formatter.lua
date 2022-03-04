-- Set vim as local variable for lua diagnostics
local vim = vim

-- Formatter config
-- Prettier function for formatter
local prettier = function()
  return {
    exe = "/Users/cbasar/.nvm/versions/node/v14.15.1/bin/prettier",
    args = {
      "--stdin-filepath",
      "--config-precedence",
      "prefer-file",
      vim.api.nvim_buf_get_name(0),
      "--single-quote"
    },
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettier},
      json = {prettier},
      typescript = {prettier},
      html = {prettier},
      css = {prettier},
      scss = {prettier},
      markdown = {prettier},
      vue = {prettier},
      lua = {
        -- luafmt
        function()
          return {
            exe = "/Users/cbasar/.nvm/versions/node/v14.15.1/bin/luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- Runs Prettier on save
vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.json,*.ts,*.css,*.scss,*.md,*.html,*.lua,*.vue : FormatWrite
  augroup END
  ]],
  true
)

-- " Provided by setup function
-- nnoremap <silent> <leader>f :Format<CR>
