{ lib, pkgs, ... }:
with lib;
{
  user = "andredanielsson";

  nix = {
    # Enable flakes by default
    package = pkgs.nixFlakes;
    configureBuildUsers = true;
    settings = {
      allowed-users = [ user ];
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" "aarch64-darwin" ];
    };
  };

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
  };

  environment = {
    variables = {
      EDITOR = "vim";
    };
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      nerdfonts
      #corefonts # TODO fix
      recursive
    ];
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleFontSmoothing = 0;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
      };
    };
  };

  system.stateVersion = 4;
}
