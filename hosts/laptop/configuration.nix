{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix

    ./hardware/bluetooth.nix
    ./hardware/opengl.nix
    ./hardware/pulseaudio.nix

    ./networking/network.nix

    ../shared/configuration.nix
  ];
}

