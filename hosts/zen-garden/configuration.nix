{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Flatpak
  services.flatpak.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "zen-garden";
  networking.networkmanager.enable = true;

  # Time and Locale
  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };

  # Console and Keyboard
  console.keyMap = "cz-lat2";
  services.xserver = {
    enable = true;
    xkb = {
      layout = "cz";
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Sound (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # GPG agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Zsh shell
  programs.zsh.enable = true;

  # Create user (without specifying packages here)
  users.users.andy = {
    isNormalUser = true;
    description = "Ondřej Tuček";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  # Allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    zsh
    papirus-icon-theme
    nerd-fonts.blex-mono
    gruvbox-gtk-theme
  ];

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    22
    3000
    8000
  ];

  # Enable nix command and flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # System state version
  system.stateVersion = "24.11";
}
