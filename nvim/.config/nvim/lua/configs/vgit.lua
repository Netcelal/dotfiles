-- VGit config
require("vgit").setup(
  {
    keymaps = {
      ["n [g"] = "hunk_up",
      ["n ]g"] = "hunk_down",
      ["n <leader>gs"] = "buffer_hunk_stage",
      ["n <leader>gr"] = "buffer_hunk_reset",
      ["n <leader>gf"] = "buffer_hunk_preview",
      ["n <leader>gb"] = "buffer_blame_preview",
      ["n <leader>gp"] = "buffer_diff_preview",
      ["n <leader>gh"] = "buffer_history_preview",
      ["n <leader>gu"] = "buffer_reset",
      ["n <leader>gg"] = "buffer_gutter_blame_preview",
      ["n <leader>gl"] = "project_hunks_preview",
      ["n <leader>gd"] = "project_diff_preview",
      ["n <leader>gq"] = "project_hunks_qf",
      ["n <leader>gx"] = "toggle_diff_preference"
    }
  }
)
