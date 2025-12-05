{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in {
  programs = {
    direnv.enable = true;
    gamemode.enable = true;
    java.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;

    corectrl = {
      enable = true;
      # gpuOverclock = {
      #   enable = true;
      #   ppfeaturemask = "0xffffffff";
      # };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [ # HACK! FIX LATER!
                "ciscoPacketTracer8-8.2.2"
  ];

  environment = {
    systemPackages = with pkgs; [
      kdePackages.krdp
      kdePackages.krdc
      kdePackages.krfb
      kdePackages.sddm-kcm
      kdePackages.oxygen
      kdePackages.kpat
      iio-sensor-proxy
      libinput
      amdgpu_top
      ardour
      audacity
      bottles
      lutris
      lm_sensors
      carla
      clinfo
      ciscoPacketTracer8
      easyeffects
      foot
      fastfetch
      git
      mesa-demos
      qbittorrent
      pkgs-stable.jamesdsp
      jdk17
      jdk8
      jdk
      jetbrains.idea-community-bin
      kdePackages.kdenlive
      kdePackages.plasma-thunderbolt
      krita
      firefox
      lshw
      libreoffice-qt6-fresh
      maliit-keyboard
      mangohud
      moonlight-qt
      mpv
      mysql-workbench
      nil
      nvtopPackages.full
      neovim
      obs-studio
      okteta
      onlyoffice-desktopeditors
      htop
      hack-font
      pciutils
      prismlauncher
      protonup-ng
      protonup-qt
      protonvpn-gui
      pysolfc
      qbittorrent
      reaper
      rnote
      ryzenadj
      steamtinkerlaunch
      sshfs
      unrar
      uw-ttyp0
      inputs.nixpkgs-stable.legacyPackages.x86_64-linux.vesktop
      vlc
      vulkan-tools
      wget
      waypipe
      xournalpp
      vscodium-fhs
    ];
  };
}
