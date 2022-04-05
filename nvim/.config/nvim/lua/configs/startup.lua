local startup = require("startup")
startup.create_mappings(
  {
    ["<leader>ff"] = "<cmd>Telescope find_files<CR>",
    ["<leader>fl"] = "<cmd>Telescope git_files<CR>"
  }
)
startup.setup({theme = "my_evil"})

vim.api.nvim_set_keymap("n", "<leader>st", "<cmd>Startup display<CR>", {noremap = true, silent = true})
