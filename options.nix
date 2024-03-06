# PLEASE READ THE WIKI FOR DETERMINING
# VALUES FOR THIS PAGE. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  # YOU MUST CHANGE THIS 
  userHome = "/home/greg";
in {
  # User Variables
  gitUsername = "Greqory";
  gitEmail = "gregor.thume@gmail.com";
  theme = "catppuccin-latte";
  slickbar = true;
  borderAnim = true;
  browser = "brave";
  wallpaperGit = "https://github.com/Greqory/Wallpapers.git";
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  flakeDir = "${userHome}/greg-os";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  terminal = "alacritty";

  # System Settings
  theLocale = "en_US.UTF-8";
  theKBDLayout = "de";
  theSecondKBDLayout = "pl";
  theLCVariables = "de_DE.UTF-8";
  theTimezone = "Europe/Berlin";
  theShell = "zsh"; # Possible options: bash, zsh
  theKernel = "default"; # possible options: default, latest, lqx, xanmod, zen
  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "intel";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  intel-bus-id = "PCI:0:2:0";
  nvidia-bus-id = "PCI:14:0:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # Printer, NTP, HWClock Settings
  localHWClock = false;
  ntp = true;
  printer = false;

  # Enable Flatpak & Larger Programs
  flatpak = true;
  kdenlive = false;
  blender = false;

  # Enable Support For
  # Logitech Devices
  logitech = true;

  # Enable Terminals
  # If You Disable All You Get Kitty
  wezterm = false;
  alacritty = true;
  kitty = false;

  # Enable Python & PyCharm
  python = true;

}
