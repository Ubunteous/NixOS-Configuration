{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.languages.rust;
  langcfg = config.languages;
in {
  options.languages.rust = {
    enable = mkEnableOption "Enables support for the rust programming language";
  };

  config = mkIf (langcfg.enable && cfg.enable) {
    users.users.${user} = {
      packages = with pkgs; [
        rustc

        # cargo # packet manager
        # rustup # toolchain installer

        rust-analyzer # lsp
        rustfmt
        clippy # lint
      ];
    };
  };
}
