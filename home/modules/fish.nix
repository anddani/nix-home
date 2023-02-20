{ config, pkgs, libs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [{
      name="foreign-env";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-foreign-env";
        rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
        sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
      };
    }];
    interactiveShellInit = ''
      if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fenv source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      end
      if test -e '/Users/andredanielsson/.cargo/env'
        fenv source '/Users/andredanielsson/.cargo/env'
      end
      fish_vi_key_bindings
    '';
    shellAliases = {
      ll = "ls -l";
      l = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
