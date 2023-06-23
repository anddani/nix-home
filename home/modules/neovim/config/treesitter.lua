require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- This needs to be empty otherwise treesitter complains about
    -- directory being not being writable. All the installation of the
    -- parsers is done declaratively into an immutable location using nix,
    -- so we don't really need to specify anything there.
    -- https://github.com/NixOS/nixpkgs/issues/189838
  },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  indent = { enable = true },
  refactor = { highlight_definitions = { enable = true } }
}

