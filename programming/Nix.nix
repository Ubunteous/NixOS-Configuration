{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.languages.nix;
  langcfg = config.languages;
in {
  options.languages.nix = {
    enable = mkEnableOption "Enables support for the nix programming language";
  };

  config = mkIf (langcfg.enable && cfg.enable) {
    users.users.${user} = {
      packages = with pkgs; [
        # nil # lsp > light
        nixd # lsp > powerfull

        # nixfmt # for the new RFC 166-style formatter
        nixfmt-classic # formatter
        # alejandra # formatter

        deadnix # find unused vars/params
        nixpkgs-hammering # check errors in packages

        statix # linter
        # Ignore lints and fixes by creating a statix.toml file at your project root:
        # use statix list for more options
        # disabled = ["repeated_keys"]
        # nix_version = '2.4'
        # ignore = ['.direnv', "packages/nodePackages/node-env.nix", "npins/default.nix"]

        #########
        # TOOLS #
        #########

        # see configuration options and dependencies
        # nix-inspect # nix-inspect -p ~/.nix.d
        # nix-tree

        # visualise vc-roots to delete
        # nix-du

        # index generation freezes computer
        # nix-index # nix-locate command

        # generate package from url
        # nix-init

        # pipe build for extra info
        # nix-output-monitor # nom-command

        # documentation
        # manix
      ];
    };
  };
}
