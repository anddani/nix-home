{ ... }:
{
  security.pam.services.sudo_local.touchIdAuth = true;

  programs = {
    zsh.enable = true;
  };

  environment = {
    variables = {
      EDITOR = "vim";
    };
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        _HIHideMenuBar = false;
        AppleFontSmoothing = 0;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        autohide = true;
      };
    };
  };

  nix.linux-builder = {
    enable = true;
    ephemeral = true;
    systems = [ "x86_64-linux" "aarch64-linux" ];
  };

  system.stateVersion = 4;
}
