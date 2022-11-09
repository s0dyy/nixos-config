{
  services.openssh = {
    enable = false;
    passwordAuthentication = false;
    permitRootLogin = false;
    #settings.PasswordAuthentication = false;
    #settings.PermitRootLogin = false;
  };
}
