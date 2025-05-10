{ config, pkgs, ... }:

{

  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    username = "andy";
    homeDirectory = "/home/andy";
    stateVersion = "24.11";

    sessionVariables = {
      GTK_THEME = "palenight";
    };

    packages = with pkgs; [
      # Essentials
      htop
      neofetch
      curl
      wget
      git
      unzip
      gnome-terminal

      # Shell & CLI improvements
      starship
      zoxide
      fzf
      bat
      eza

      # Editors
      micro
      zed-editor
      vscode

      # Browsers
      firefox
      ungoogled-chromium

      # Dev tools
      docker
      docker-compose
      bruno
      gh

      # Runtimes & languages
      nodejs
      deno
      jdk17
      python3
      python311Packages.virtualenv
      yarn
      bun
      go
      pipx
      dotnet-sdk

      # Nix tooling
      nixfmt-rfc-style
      nil
      nixd
      alejandra
      nix-tree
      nvd

      # GNOME/Linux tools
      pkgs.gnome-tweaks
      gnomeExtensions.caffeine
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.dash-to-dock
      gnomeExtensions.emoji-copy
      gnomeExtensions.system-monitor
      gnomeExtensions.user-themes
      gnomeExtensions.workspace-indicator
      gruvbox-dark-gtk
      flatpak

      # Multimedia
      spotify
    ];
  };

  # Copy wallpapers to desired locations
  home.file.".local/share/backgrounds/gruvbox-skull.jpg".source =
    ./meta/wallpapers/gruvbox-skull/gruvbox-skull.jpg;

  home.file.".local/share/backgrounds/gruvbox-skull--dark.png".source =
    ./meta/wallpapers/gruvbox-skull/gruvbox-skull--dark.png;

  # Setup GTK
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-dark-gtk;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

  };

  # Setup GNOME specifics
  dconf.settings = {

    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/gruvbox-skull.jpg";
      picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/gruvbox-skull--dark.png";
    };

    "org/gnome/desktop/interface" = {
      gtk-theme = "Gruvbox-Dark-B";
      icon-theme = "Papirus";
      cursor-theme = "Adwaita";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "RIGHT";
      extend-height = false;
      dash-max-icon-size = 32;
      custom-theme-shrink = true;
    };

    "org/gnome/shell/extensions/system-monitor" = {
      show-download = true;
      show-swap = false;
      show-upload = true;
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      enable-animations = true;
      text-scaling-factor = 1;
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        "caffeine@patapon.info"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "emoji-copy@felipeftn"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
      ];
    };

  };

  programs.home-manager.enable = true;
}
