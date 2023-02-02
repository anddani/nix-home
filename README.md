# nix-home
`$ nix build .#darwinConfigurations.mbp2019.system`
`$ ./result/sw/bin/darwin-rebuild switch --flake .`

`$ home-manager switch --flake .#mbp2019`

# old nix-home
`$ darwin-rebuild switch -I darwin-config=PATH/TO/configuration.nix~


