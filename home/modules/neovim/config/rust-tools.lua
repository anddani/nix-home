local capabilities = require("cmp_nvim_lsp").default_capabilities()
local rt = require("rust-tools")

rt.setup({
  tools = {
    hover_actions = { auto_focus = true },
  },
  server = {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
        -- RA will scan .direnv correspondingly entire nixpkgs repository
        files = { excludeDirs = { ".direnv" } }
      }
    },
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

