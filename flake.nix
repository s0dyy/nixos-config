  {
    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
      home-manager.url = "github:nix-community/home-manager/release-22.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      #home-manager.url = "github:nix-community/home-manager";
      #home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ nixpkgs, home-manager, ... }: {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.s0dyy = import ./hosts/shared/home.nix;
            }
          ];
        };
      };
    };
  }
