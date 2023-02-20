# nix-home

## Install

1. Install Nix multi-user: https://nixos.org/download.html#nix-install-macos

2. Install standalone home-manager: https://github.com/nix-community/home-manager#installation

## Nix Darwin

`$ nix build .#darwinConfigurations.Danielsson.system --extra-experimental-features "nix-command flakes"`

`$ ./result/sw/bin/darwin-rebuild switch --flake .`

`$ chsh -s /run/current-system/sw/bin/fish`

## Home manager

`$ home-manager switch --flake .#mbp2023`

# old nix-home

`$ darwin-rebuild switch -I darwin-config=PATH/TO/configuration.nix`


