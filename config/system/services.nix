{ pkgs, config, lib, ... }:

{
  # List services that you want to enable:
  virtualisation.docker.enable = true;
  services.openssh.enable = false;
  services.fstrim.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [ pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;
  sound.enable = true;
  security.rtkit.enable = true;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  # undervolting services:
  services.undervolt = {   
    enable = true;
    coreOffset = -100;
    uncoreOffset = -100;
    analogioOffset = -100;
    gpuOffset = -100;
    #temp = 90;
    #p1.limit = 60;
    #p1.window = 99;
    #p2.limit = 60;
    #p2.window = 999;
    useTimer = true;
  };

  # Laptop Power settings:
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       #START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
  };

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # ModemManager services
  # services.modemmanager.enable = true;
  networking.networkmanager.enable = true;

  # enable powertop:
  powerManagement.powertop.enable = true;
}
