# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    telegram-desktop
    gimp
    obs-studio
    droidcam
    kdePackages.kdenlive
    discord
    qbittorrent
    winbox4
    vlc
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU

    # CLI utils
    fastfetch
    wget
    tree
    htop
    mcrcon
    docker-compose

    # Language runtimes & toolchains
    python314
    virtualenv
    jdk8
    jdk

    # Code editor
    jetbrains.pycharm-oss
    jetbrains.idea-oss
    vscode.fhs
  ];
  
  # List fonts.
  fonts.packages = with pkgs; [
    times-newer-roman
  ];
}
