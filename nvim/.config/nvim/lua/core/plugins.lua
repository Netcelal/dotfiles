-- Set vim as local variable for lua diagnostics
local vim = vim

-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.cmd [[autocmd FileType lua setlocal foldmethod=marker]]

-- Plugins
-- Install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require("packer").use
require("packer").startup(
  function()
    -- Package manager
    use "wbthomason/packer.nvim"

    -- Better nvim startup performance
    use "lewis6991/impatient.nvim"

    -- Set background to transparent
    use "tribela/vim-transparent"

    -- autopairs
    use "cohama/lexima.vim"

    -- Smooth scroll for Neovim
    use {"karb94/neoscroll.nvim"}

    -- Neovim + TMux integration
    use "christoomey/vim-tmux-navigator"

    -- Themes
    -- use "joshdick/onedark.vim" -- Theme inspired by Atom
    -- use "folke/tokyonight.nvim"
    -- use "ayu-theme/ayu-vim"
    -- use "marko-cerovac/material.nvim"
    -- use "dracula/vim" -- Theme Dracula
    use(
      {
        "catppuccin/nvim",
        as = "catppuccin"
      }
    )

    -- Git integration for Neovim
    use {
      "TimUntersberger/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim"
      }
    }

    -- "gc" to comment visual regions/lines
    use "numToStr/Comment.nvim"

    -- Display todo comments in code
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
      end
    }

    -- Surround everything
    use "tpope/vim-surround"

    -- UI to select things (files, grep results, open buffers...)
    use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- Fancy start screen for Vim
    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    }
    -- Which Key
    use {
      "folke/which-key.nvim"
    }

    -- Formatter: Syntax formatter for programming languages
    use "mhartington/formatter.nvim"

    -- Fancier statusline and tabline
    use {
      "tamton-aquib/staline.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {"nvim-lua/lsp-status.nvim"}

    use {"phaazon/hop.nvim"} -- Jump to anywhere

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use "nvim-treesitter/nvim-treesitter"

    -- Additional textobjects for treesitter
    use "nvim-treesitter/nvim-treesitter-textobjects"

    -- Snippets
    use "rafamadriz/friendly-snippets"
    use "L3MON4D3/LuaSnip"
    -- LSP Plugins
    use(
      {
        "hrsh7th/nvim-cmp",
        requires = {
          {"hrsh7th/cmp-nvim-lsp"},
          {"hrsh7th/cmp-nvim-lua"},
          {"hrsh7th/cmp-buffer"},
          {"hrsh7th/cmp-path"},
          {"hrsh7th/cmp-cmdline"},
          {"saadparwaiz1/cmp_luasnip"},
          {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
        }
      }
    )
    use "neovim/nvim-lspconfig"
    use({"onsails/lspkind-nvim", requires = {"famiu/bufdelete.nvim"}})

    -- Icons
    use {
      "yamatsum/nvim-nonicons",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    -- Golang
    use "fatih/vim-go"

    -- use {
    --   "folke/trouble.nvim",
    --   requires = "kyazdani42/nvim-web-devicons",
    --   config = function()
    --     require("trouble").setup {}
    --   end
    -- }
  end
)
