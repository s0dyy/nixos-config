{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #config.pipewire = {
      #"context.properties" = {
        #"link.max-buffers" = 64;
        #"log.level" = 2;
        #"default.clock.rate" = 44100;
        #"default.clock.allowed-rates" = [ 44100 48000 88200 96000 192000 ];
        #"default.clock.quantum" = 1024;
        #"default.clock.min-quantum" = 32;
        #"default.clock.max-quantum" = 8192;
      #};
    #};
  };
}
