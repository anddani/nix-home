# nix-home
`$ nix build .#darwinConfigurations.Danielsson.system --extra-experimental-features "nix-command flakes"`
`$ ./result/sw/bin/darwin-rebuild switch --flake .`

`$ home-manager switch --flake .#mbp2019`

# old nix-home
`$ darwin-rebuild switch -I darwin-config=PATH/TO/configuration.nix`


