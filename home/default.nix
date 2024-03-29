{ user, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.${user}.home = {
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "emacs";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };

  imports = [
    ./dunst.nix
    ./flameshot.nix
    # conflict with .mozilla/firefox/default/search.json.mozlz4
    ./firefox.nix
    ./git.nix
    ./mime.nix # another app is creating mimes => fixed with force
    ./picom.nix
    ./themes.nix
    ./u-he.nix
    ./xautolock.nix # replace it with a service
    
    ./terminal/alacritty.nix
    ./terminal/bash.nix      
    ./terminal/fish.nix
    ./terminal/kitty.nix
    ./terminal/neovim.nix
    ./terminal/zsh.nix

    ./emacs.nix
    ./xdg-user-dir.nix # for OB-xD synth
    
    # Unstable: "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    # Troubleshoot: systemctl status "home-manager-$USER.service"
    # Hint: Home manager hates when a config file already exists
    # For unsupported apps: home.file."path/to/file".source = ./a/dotfile/repo/file;
  ];
}
