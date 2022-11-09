{
  # auto login with machinectl
  # systemctl edit --full container-getty@.service (inside the container)
  # ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --keep-baud --autologin <USER> - 115200,38400,9600 $TERM
  systemd.nspawn.debian = {
    networkConfig.Private = false;
    execConfig = {
      PrivateUsers = "off";
    };
    #filesConfig = {
      #Bind = [ 
        #"/home/s0dyy/Documents/github/s0dyy/nix-config"
        #"/home/s0dyy/Documents/gitlab-exherbo"
        #"/home/s0dyy/Documents/github/s0dyy/exherbo-config:/etc/paludis"
      #];
    #};
  };
  systemd.services."systemd-nspawn@debian" = {
    wantedBy = [ "machines.target" ];
    overrideStrategy = "asDropin";
  };
}
