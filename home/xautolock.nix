{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.home.xautolock;
  homecfg = config.home;
in
{
  options.home.xautolock = {
    enable = mkEnableOption "Enable support for xautolock";
  };

  config = mkIf (homecfg.enable && cfg.enable) {
    #################
    #   XAUTOLOCK   #
    #################

    # exec --no-startup-id ~/bin/start-xautolock
    # ~/.locker/start-xautolock &
    home.file.".locker/start-xautolock" = {
      text = ''
      ${pkgs.xautolock}/bin/xautolock \
                -time 5 \
                -locker ~/.nix.d/files/locker.sh \
                -notify 55 \
                -notifier "${pkgs.libnotify}/bin/notify-send 'Locking soon'" \
                -detectsleep \
                -corners ++-- \
                -killtime 30 \
                -killer "systemctl suspend"
    '';
      executable = true;
    };
    # ${pkgs.xautolock}/bin/xautolock -time 10 \
    # -locker physlock \
  };
}
