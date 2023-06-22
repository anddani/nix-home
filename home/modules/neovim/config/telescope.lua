local telescope = require("telescope")
-- 
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

telescope.setup({
    defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    layout_config = {
      height = 0.9,
      preview_width = 80,
      width = 0.9,
    },
    mappings = {
      i = {
        ["<c-s>"] = require("trouble.providers.telescope").open_with_trouble,
        ["<esc>"] = require("telescope.actions").close,
      },
    },
    prompt_prefix = " ",
    selection_caret = "❯ ",
  },
  pickers = {
    find_files = { hidden = true },
  },
})

telescope.load_extension("fzf")
