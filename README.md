# ❄️ Greg's NixOS Configs

## Install / Steps To Reproduce My System

- Enable flakes, and the Hyprland cache so you don't have to build it, in your default configuration.nix by adding this:

```
# Enable Flakes and the new command-line tool
nix = {
  settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
};
```

This file should be located at /etc/nixos/configuration.nix

- Ensure you have Git listed in your pkgs in the /etc/nixos/configuration.nix file.
- Change the hostname in the /etc/nixos/configuration.nix file.
- Rebuild your system.

```
sudo nixos-rebuild switch
```

- Reboot your system.
- Clone this repo.
- Then go into repo folder (stay in this folder).
- Change username and hostname in flake.nix file.
- Change all options in options.nix as needed.
- Generate your hardware.nix like so:

```
nixos-generate-config --show-hardware-config > hardware.nix
```

- Run this command:

```
sudo nixos-rebuild switch --flake .
```

Now when you want to rebuild the configuration you have access to an alias called flake-rebuild that will rebuild the flake based of the flakeDir variable you set in options.nix!

Hope you enjoy!
