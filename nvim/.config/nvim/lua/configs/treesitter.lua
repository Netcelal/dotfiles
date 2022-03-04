-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
