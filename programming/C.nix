{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.languages.c;
  langcfg = config.languages;
  in {
    options.languages.c = {
      enable = mkEnableOption "Enables support for the C programming languages";
    };

    config = mkIf (langcfg.enable && cfg.enable) {
    users.users.${user} = {
      packages = with pkgs; [
        clang # better than gcc
        clang-tools # clang-format and clang-tidy

        ccls # lsp
        # gcc # use gcc with C and g++ with C++

        # build essentials bundles: gcc/g++,libc6-dev,make,dpkg-dev
      ];
    };
  };
}
