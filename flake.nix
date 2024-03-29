{
  description = "Greg-OS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # custom content for t480:
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-hardware, ... }:
  let
    system = "x86_64-linux";
    username = "greg";
    hostname = "nixe";

    pkgs = import nixpkgs {
      inherit system;
      config = {
	    allowUnfree = true;
	    # permittedInsecurePackages = "freeimage-unstable-2021-11-01";
      };
    };
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
	specialArgs = { 
          inherit system; inherit inputs;
          inherit username; inherit hostname;
        };
	modules = [ 
	  ./system.nix
          home-manager.nixosModules.home-manager {
	    home-manager.extraSpecialArgs = {
	      inherit username; inherit inputs;
              inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
            };
	    home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
	    home-manager.users.${username} = import ./home.nix;
	  }
	  # Custom content for t480:
	  nixos-hardware.nixosModules.lenovo-thinkpad-t480
	];
      };
    };

    # undervolting kernel driver:
    environment.systemPackages = [
      pkgs.linuxKernel.packages.linux_6_1.phc-intel
    ];

    # allowing stupid shit:
    nixpkgs.config.permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
    ];

  };
}
