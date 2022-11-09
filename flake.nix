{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    homeManager.url = "github:nix-community/home-manager";
    homeManager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = inputs@{ nixpkgs, home-manager, homeManager, ... }: {
    # TODO: Rewrite in a more elegant way to avoid code duplication
    nixosConfigurations = {

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.s0dyy = import hosts/shared/home.nix;
          }
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.s0dyy = import hosts/shared/home.nix;
          }
        ];
      };

      homeConfigurations = {
        "s0dyy@nspawn-exherbo" = inputs.home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/s0dyy";
          username = "s0dyy";
          stateVersion = "21.11";

          configuration = {pkgs, ...}: {
            programs.home-manager.enable = true;
            #home.packages = [
              #pkgs.btop
            #];
          };
        };
      };
    };
    };
  }
