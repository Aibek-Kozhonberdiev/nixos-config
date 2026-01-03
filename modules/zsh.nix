{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 10000;
    shellAliases = {
      flatpak-update = "flatpak update -y";
      update = "sudo nixos-rebuild switch --upgrade && flatpak update -y";
      nixos-clear = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";
      open = "xdg-open";
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh.enable = true;
    ohMyZsh.theme = "zhann";
    ohMyZsh.plugins = [
      "git"
    ];
  };

  # Prevent the new user dialog in zsh
  system.userActivationScripts.zshrc = "touch .zshrc";
}
