vim.g.mapleader = ','

local wk = require("which-key")

wk.setup({})

wk.register({
    ["<leader>"] = {
        g = {
            name = "Git",
            --[[
            i = { "<cmd>lua require('telescope').extensions.gh.issues()<cr>", "Github Issues" },
            p = { "<cmd>lua require('telescope').extensions.gh.pull_request()<cr>", "Github PRs" },
            b = { "<cmd>ToggleBlameLine<cr>", "Toggle BlameLine" },
            ]]--
            g = { "<cmd>Neogit<cr>", "Neogit" }
        },
        t = {
          name = "Floaterm",
          n = { "<cmd>FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <cr>", "New terminal" },
          t = { "<cmd>FloatermToggle myfloat<cr>", "Toggle terminal" },
        }
    },
    K = { "", "Show documentation" },
    ["<C-t>"] = { "<cmd>NERDTreeToggle<cr>", "Toggle NERDTree" },
    ["<C-p>"] = { "<cmd>tabnext<cr>", "Previous tab" },
    ["<C-n>"] = { "<cmd>tabnext<cr>", "Next tab" }
})
