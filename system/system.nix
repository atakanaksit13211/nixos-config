{ pkgs, ... }:

{
  users.users.quantrop = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "quantrop";
    extraGroups = ["networkmanager" "wheel" "input"];
    packages = [];
  };

  users.users.ayfer = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "ayfer";
    extraGroups = ["networkmanager" "input"];
    packages = [];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"
  '';

  system.stateVersion = "24.11";
}
