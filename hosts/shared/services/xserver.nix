{
  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    #videoDrivers = [ "nvidia" ];
  };
}
