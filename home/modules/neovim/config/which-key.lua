vim.g.mapleader = ','

local wk = require("which-key")

wk.setup({})

wk.register({
    ["<leader>"] = {
        g = {
            name = "Git"
            --[[
            i = { "<cmd>lua require('telescope').extensions.gh.issues()<cr>", "Github Issues" },
            p = { "<cmd>lua require('telescope').extensions.gh.pull_request()<cr>", "Github PRs" },
            b = { "<cmd>ToggleBlameLine<cr>", "Toggle BlameLine" },
            ]]--
            g = { "<cmd>Neogit<cr>", "Neogit" }
        }
    }
})
