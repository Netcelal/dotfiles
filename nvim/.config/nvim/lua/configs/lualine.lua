-- Lualine config
-- local function displayHour()
--   return " " .. os.date("%d.%m.%Y :: %H:%M") .. " "
-- end

require "lualine".setup {
  options = {
    icons_enabled = true,
    theme = "auto", -- "powerline",
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {"mode", "paste"},
    lualine_b = {"branch", "diff"},
    lualine_c = {
      {"filename", file_status = true, path = 1},
      require "lsp-status".status
    },
    lualine_x = {
      {"diagnostics", sources = {"nvim_diagnostic"}},
      -- function()
      --   return "%="
      -- end,
      "filetype"
    },
    -- lualine_y = {"progress", "location"}
    lualine_y = {"progress"}
    -- lualine_z = {displayHour}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
