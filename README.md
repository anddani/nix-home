# nix-home

# Nix Darwin

## Install Nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
sudo reboot

nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
nix-channel --update
nix-shell '<darwin>' -A installer
darwin-rebuild switch

`$ nix --experimental-features "nix-command flakes" build ".#darwinConfigurations.mbp2023.system"`

`$ ./result/sw/bin/darwin-rebuild switch --flake .`

