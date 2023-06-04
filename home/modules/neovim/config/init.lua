vim.opt.expandtab = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.incsearch = true

vim.api.nvim_set_keymap(
  'i',
  '<TAB>',
  [[coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"]],
  {expr = true}
)
