{ config, pkgs, inputs, ... }:

let
  unstable = import inputs.unstable {
    system = pkgs.system;
    # Uncomment this if you need an unfree package from unstable.
    #config.allowUnfree = true;
  };
in

{
  imports = [
    ./programs/alacritty.nix
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/git.nix
    ./programs/neovim.nix
    ./programs/slack.nix
    ./programs/spotify.nix
    ./programs/starship.nix
    ./programs/vscode.nix
    ./programs/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
}
