vim.g.mapleader = ','

local wk = require("which-key")

wk.setup({})

wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope",
      f = { "<cmd>Telescope find_files<cr>", "Find file" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Go to definition" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep" },
      e = { "<cmd>Telescope diagnostics<cr>", "Find diagnostic" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Find implementations" },
      u = { "<cmd>Telescope lsp_references<cr>", "Find usages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" }
    },
    g = { "<cmd>LazyGit<cr>", "Open LazyGit" },
    D = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to previous diagnostic" },
    d = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename variable" },
  },
  ["<SPACE>"] = { "zz", "Center screen" },
  ["<C-t>"] = { "<cmd>NERDTreeToggle<cr>", "Toggle NERDTree" },
  ["<C-p>"] = { "<cmd>tabprevious<cr>", "Previous tab" },
  ["<C-n>"] = { "<cmd>tabnext<cr>", "Next tab" },
  ["<C-/>"] = { "<cmd>FloatermToggle myfloat<cr>", "Toggle terminal" }
})
