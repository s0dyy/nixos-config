{ config, pkgs, ... }:

{
  imports = [ 
    ./boot/boot.nix

    ./console/console.nix

    ./pkgs/world.nix

    ./security/security.nix

    ./services/clamav.nix
    ./services/exherbo.nix
    ./services/openssh.nix
    ./services/pipewire.nix
    ./services/xserver.nix

    ./time/time.nix

    ./users/s0dyy.nix

    ./virtualization/docker.nix
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
}

