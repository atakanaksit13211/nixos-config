{ pkgs, ... }:

{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };

    mysql = {
      enable = true;
      package = pkgs.mysql80;
    };

    xserver = {
      enable = true;
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  systemd = {
    services = {
      startup = {
        script = ''
          ${pkgs.ryzenadj}/bin/ryzenadj --set-coall=0xFFFF0 -a 20000 -b 24000 -c 22000
          ${pkgs.coreutils}/bin/echo 84 | ${pkgs.coreutils}/bin/tee /sys/class/power_supply/BAT0/charge_control_end_threshold
          '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
