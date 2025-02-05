# nix-home

# Nix Darwin

## Install Nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
sudo reboot

nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
nix-channel --update
nix-shell '<darwin>' -A installer
darwin-rebuild switch

First time (before nix darwin settings are applied):
`$ nix --experimental-features "nix-command flakes" build ".#darwinConfigurations.anddaniM2.system"`

After settings are applied:
`$ nix build ".#darwinConfigurations.anddaniM2.system" && ./result/sw/bin/darwin-rebuild switch --flake .`

`$ ./result/sw/bin/darwin-rebuild switch --flake .`

### Install Doom Emacs

`$ git clone https://github.com/hlissner/doom-emacs ~/.emacs.d`
`$ ~/.emacs.d/bin/doom install`
