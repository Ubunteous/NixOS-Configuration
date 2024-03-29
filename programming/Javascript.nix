{ config, lib, pkgs, user, ... }:

with lib;
let
  cfg = config.languages.javascript;
  langcfg = config.languages;
  in {
    options.languages.javascript = {
      enable =
	mkEnableOption "Enables support for the Javascript programming languages";
  };

  config = mkIf (langcfg.enable && cfg.enable) {
    users.users.${user} = {
      packages = with pkgs; [
        # nodePackages.nodejs
        # nodePackages.create-react-app

        # biome # lint/format => does not send to stdout
        nodePackages.typescript-language-server
        nodePackages.prettier

        nodejs
        create-react-app
      ];
    };
  };
}
