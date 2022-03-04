-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Telescope config
require("telescope").setup {
  layout_config = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_position = "bottom",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
        preview_width = 0.5
      },
      vertical = {
        mirror = false
      }
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  }
}

--Add leader shortcuts
map("n", "\\\\", [[<cmd>lua require('telescope.builtin').builtin()<CR>]], opts)
map("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
map("n", "<leader>sb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
map("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
map("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
map("n", "<leader>fw", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
map("n", "<leader>fl", [[<cmd>lua require('telescope.builtin').file_browser()<CR>]], opts)
