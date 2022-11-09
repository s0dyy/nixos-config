{ config, pkgs, ... }:

{
  imports = [ 
    ./boot/boot.nix

    ./console/console.nix

    ./pkgs/world.nix

    ./security/security.nix

    ./services/clamav.nix
    #./services/debian.nix
    ./services/exherbo.nix
    ./services/openssh.nix
    ./services/pipewire.nix
    ./services/xserver.nix

    ./time/time.nix

    ./users/s0dyy.nix

    ./virtualization/docker.nix
  ];


  nixpkgs.overlays = [
    (self: super: {
      fcitx-engines = pkgs.fcitx5;
    })
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
}

