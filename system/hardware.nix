{ lib, config, pkgs, ... }:
{
  services.hardware.bolt.enable = true;

  powerManagement.cpuFreqGovernor = "ondemand";

  hardware = {
    cpu.amd.ryzen-smu.enable = true;
    sensor.iio.enable = true;

    graphics = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
