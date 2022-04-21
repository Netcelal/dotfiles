-- vim:setlocal foldmethod=marker
-- Set vim as local variable for lua diagnostics
local vim = vim

-- Create local variable to shorten keymapping commands
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- LSP plugins config
-- Cmp config {{{
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end
-- Vscode-like: For using snippets from a plugin (eg. rafamadriz/friendly-snippets) install it and add
require("luasnip.loaders.from_vscode").load()
cmp.setup(
  {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
      -- ["<C-j>"] = cmp.mapping(
      --   function(fallback)
      --     if luasnip.expand_or_jumpable() then
      --       luasnip.expand_or_jump()
      --     else
      --       fallback()
      --     end
      --   end,
      --   {"i", "s"}
      -- ),
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        {"i", "s"}
      ),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping(
        {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
        }
      ),
      ["<CR>"] = cmp.mapping(
        cmp.mapping.confirm(
          {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }
        ),
        {"i", "c"}
      )
    },
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "luasnip"},
      {name = "buffer"},
      {name = "look", keyword_length = 3, option = {convert_case = true, loud = true}},
      {name = "nvim_lua"},
      {name = "calc"},
      {name = "emoji"},
      {name = "path"}
    },
    formatting = {
      format = lspkind.cmp_format(
        {
          with_text = false,
          maxwidth = 50,
          menu = {
            luasnip = "[Snippet] ✔",
            buffer = "[Buffer] ",
            nvim_lsp = "[LSP] ",
            spell = "[Spell] ",
            look = ""
          }
        }
      )
    },
    experimental = {
      ghost_text = true,
      native_menu = false
    }
  }
)

-- cmp.setup.cmdline("/", {
--   sources = {
--     { name = "buffer" },
--   },
-- })

-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })
-- }}}

-- LSP language configs {{{
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- CSS {{{
require("lspconfig").cssls.setup(
  {
    cmd = {"vscode-css-language-server", "--stdio"},
    settings = {
      scss = {
        lint = {
          idSelector = "warning",
          zeroUnits = "warning",
          duplicateProperties = "warning"
        },
        completion = {
          completePropertyWithSemicolon = true,
          triggerPropertyValueCompletion = true
        }
      }
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end
  }
)
-- }}}

-- TypeScript
require("lspconfig").tsserver.setup(
  {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end
  }
)

-- Deno
-- vim.g.markdown_fenced_languages = {
--   "ts=typescript"
-- }
-- require "lspconfig".denols.setup {}

-- HTML
require("lspconfig").html.setup(
  {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end
  }
)
-- Emmet
require("lspconfig").emmet_ls.setup(
  {
    capabilities = capabilities,
    filetypes = {"html", "css", "vue"}
  }
)

-- ESLint
require "lspconfig".eslint.setup {}

-- JSON
require "lspconfig".jsonls.setup {
  capabilities = capabilities
}

-- Volar for VueJS
require "lspconfig".volar.setup {
  capabilities = capabilities
}
-- Angular
require "lspconfig".angularls.setup {}

-- Lua
require "lspconfig".sumneko_lua.setup {}

-- Golang
require "lspconfig".gopls.setup {
  capabilities = capabilities
}
-- Docker
require "lspconfig".dockerls.setup {}

-- Bash
require "lspconfig".bashls.setup {}
-- }}}

-- LSP Prevents inline buffer annotations {{{
-- vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true,
    signs = true,
    underline = true,
    update_on_insert = false
  }
)

local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = ""
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = nil})
end

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])
-- }}}

-- LSP Mappings {{{
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gr", [[<cmd>lua require('telescope.builtin').lsp_references{}<CR>]], opts)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
-- }}}
