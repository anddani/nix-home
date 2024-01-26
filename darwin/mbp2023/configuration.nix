{ lib, pkgs, ... }:
with lib;
{
  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

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
        # _HIHideMenuBar = true;
        _HIHideMenuBar = false;
        AppleFontSmoothing = 0;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        autohide = true;
        # autohide-delay = 0.0;
        # autohide-time-modifier = 0.0;
      };
    };
  };

  system.stateVersion = 4;
}
