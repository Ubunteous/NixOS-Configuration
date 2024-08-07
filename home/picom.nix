{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.home.picom;
  homecfg = config.home;
in
{
  options.home.picom = {
    enable = mkEnableOption "Enable support for Picom";
  };

  config = mkIf (homecfg.enable && cfg.enable) {
    #############
    #   PICOM   #
    #############

    services.picom = {
      enable = true;
      # enable = true;
      # vsync = true;
      backend = "glx"; # default=xrender, alt=glx/xr_glx_hybrid
      # experimentalBackends = true; # removed by upstream in NixOS 22.11
      
      activeOpacity = 1.0;
      inactiveOpacity = 0.8;
      menuOpacity = 1.0;
      
      # fade = true; # fade-in/out when open/close window
      # fadeDelta = 10; # default 10ms
      # fadeSteps = ["0.1" "0.1"]; # default 0.3
      
      shadow = true;
      shadowOpacity = 0.75;

      # services.picom.wintypes = {
      # Window Types: "unknown", "desktop", "dock", "toolbar", "menu", "utility", "splash", "dialog", "normal", "dropdown_menu", "popup_menu", "tooltip", "notification", "combo", and "dnd".
      
      # Options (bool): face, shadow, focus,full-shadow, clip-above-shadow, redir-ignore
      # Options (float): opacity

      # Example:
      # dock = { shadow = false; clip-shadow-above = true; };
      # };

      # extraOptions replaced by services.picom.settings in NixOS 22.11
      settings = {
        corner-radius = 18;
        # round-borders = 20;
        xrender-sync-fence = true; # activates blur
        unredir-if-possible = true; # no notif over lockscreen
        
        # Exclude conditions for rounded corners.
        rounded-corners-exclude = [
          "window_type = 'dock'" # polybar
          "window_type = 'notification'"# dunst
        ];

        blur = {
          # requires --experimental-backends
          method = "dual_kawase";
          strength = 3;

          # blur alternative
          # method = "gaussian";
          # size = 10;
          # deviation = 5.0;
          
          background = true;
          background-frame = true;
          background-fixed = true;
        };
      };
    };
  };
}
