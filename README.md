# nix-home

# Nix Darwin

## Install Nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
sudo reboot

nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
nix-channel --update
nix-shell '<darwin>' -A installer
darwin-rebuild switch

`$ nix --experimental-features "nix-command flakes" build ".#darwinConfigurations.anddaniM2.system"`

`$ ./result/sw/bin/darwin-rebuild switch --flake .`

### Install Doom Emacs

`$ git clone https://github.com/hlissner/doom-emacs ~/.emacs.d`
`$ ~/.emacs.d/bin/doom install`


## Start Yabai
`yabai --start-service`
`skhd --start-service`
`brew services start borders`

Allow permissions to accessibility and run them again

To be able to navigate to spaces:
`echo "$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai)) --load-sa" | sudo tee /private/etc/sudoers.d/yabai > /dev/null`

