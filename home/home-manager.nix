{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "quantrop";
    homeDirectory = "/home/quantrop";
    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
