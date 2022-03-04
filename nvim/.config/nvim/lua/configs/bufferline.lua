-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Bufferline config
require("bufferline").setup(
  {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "(" .. count .. ")"
      end,
      separator_style = "thick" -- | "thin" ,
    }
  }
)
map("n", "bg", ":BufferLinePick<CR>", opts)
