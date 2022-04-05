local vim = vim
-- Statusline config
require("staline").setup {
  sections = {
    left = {
      "▊",
      " ",
      {"Evil", " "},
      " ", -- The mode and evil sign
      {"StalineGit", "branch"},
      " ",
      -- Branch Name in different highlight
      {"StalineFile", "file_name"},
      " ", -- Filename in different highlight
      "file_size",
      " " -- Filesize
    },
    -- mid = {" ", "lsp_name"}, -- "lsp_name" is still a little buggy
    mid = {"lsp_name"}, -- "lsp_name" is still a little buggy
    right = {
      {"StalineEnc", vim.bo.fileencoding:upper()},
      "  ", -- Example for custom section
      {"StalineEnc", "cool_symbol"},
      " ", -- the cool_symbol for your OS
      "line_column",
      "▊"
    }
  },
  defaults = {
    true_colors = true,
    bg = "#202328",
    branch_symbol = " ",
    full_path = true,
    line_column = "[%l:%c] 並%p%% "
  }
  -- mode_icons = {
  --   n = "N "
  -- }
  -- mode_colors = {
  --   n = "#38b1f0",
  --   i = "#9ece6a",
  --   c = "#8fbf7f",
  --   v = "#fc802d" -- etc mode
  -- }
}
vim.cmd [[hi Evil        guifg=#f36365 guibg=#202328]] -- Higlight for Evil symbol
vim.cmd [[hi StalineEnc  guifg=#7d9955 guibg=#202328]] -- Encoding Highlight
vim.cmd [[hi StalineGit  guifg=#8583b3 guibg=#202328]] -- Branch Name Highlight
vim.cmd [[hi StalineFile guifg=#c37cda guibg=#202328]] -- File name Highlight-- }

-- Tab config
require("stabline").setup {
  style = "bar", -- others: arrow, slant, bubble
  stab_left = "┃", -- 😬
  stab_right = " ",
  -- fg          = Default is fg of "Normal".
  -- bg          = Default is bg of "Normal".
  inactive_bg = "#1e2127",
  inactive_fg = "#aaaaaa",
  -- stab_bg     = Default is darker version of bg.,

  font_active = "bold",
  exclude_fts = {"NvimTree", "dashboard", "lir"},
  stab_start = "", -- The starting of stabline
  stab_end = ""
}
