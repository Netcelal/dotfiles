-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  -- requires 'JoosepAlviste/nvim-ts-context-commentstring'
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  -- requires 'p00f/nvim-ts-rainbow'
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
