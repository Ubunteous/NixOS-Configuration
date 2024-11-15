{ pkgs ? import <nixpkgs> { } }:

# Future update:
# + colourcopy, MFM, twangstrom
# + repro, presswerk, zebra legacy
# + zebra 3/zebralette 3, uhbik

{
  ##########
  # synths #
  ##########

  ace = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Ace";
    url = "https://dl.u-he.com/releases/ACE_143_16518_Linux.tar.xz";
    sha256 = "sha256-BJxPBuuSVeXxriZNHJgrZ+rsTnXpYp9OmCKm3ywo5bU=";
  };

  bazille = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Bazille";
    url = "https://dl.u-he.com/releases/Bazille_113_16518_Linux.tar.xz";
    sha256 = "sha256-pwj5MW6jI9f62//IX0XccWoqc4h5CEefNmvXnfGvyYw=";
  };

  diva = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Diva";
    url = "https://dl.u-he.com/releases/Diva_148_16519_Linux.tar.xz";
    sha256 = "sha256-WO5tqsHk6ukQYCc0OIpnm42GSAFabqwMH1GQHBkkdak=";
  };

  hive = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Hive";
    url = "https://dl.u-he.com/releases/Hive_212_16520_Linux.tar.xz";
    sha256 = "sha256-HKxa01+mawPRCRPESlN2uERvVQv6zRP1yTeAJvwK+sM=";
  };

  repro = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Repro";
    url = "https://dl.u-he.com/releases/Repro_112_12092_Linux.tar.xz";
    sha256 = "";
  };

  zebra-legacy = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Zebra-Legacy";
    url = "https://dl.u-he.com/releases/Zebra_Legacy_293_12092_Linux.zip";
    sha256 = "sha256-MDsLzTTQ8VDfmmRxqaWvtK4K9aVN2SHIbBY2JJXIGps=";
  };

  ############
  # freebies #
  ############

  podolski = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Podolski";
    url = "https://dl.u-he.com/releases/Podolski_123_12092_Linux.tar.xz";
    sha256 = "sha256-iNkab7kkmXcy6JrubkC8o4mFUp0FngcIICKAWu+DRow=";
  };

  triple-cheese = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Triple Cheese";
    url = "https://dl.u-he.com/releases/TripleCheese_13_12092_Linux.tar.xz";
    sha256 = "sha256-Xe0t2oiOWhNe5+U8JLt3b3WrZgYyLQgTSCQElL4uz68=";
  };

  # link from amazona.de
  tyrell = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Tyrell";
    url = "https://www.amazona.de/wp-content/tyrell/TyrellN6_V303_Linux.tar.gz";
    sha256 = "sha256-vv3QNwWTBATRK0CAAeFPN+VV3nz2pOk5tWLE/8L9d/0=";
  };

  zebralette3 = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Zebralette-3";
    url =
      "https://dl.u-he.com/betas/public/zebralette3/Zebralette3_001_public_beta_15573_Linux.tar.xz";
    sha256 = "";
  };

  ###########
  # effects #
  ###########

  colourcopy = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Colourcopy";
    url = "https://dl.u-he.com/releases/ColourCopy_101_12092_Linux.tar.xz";
    sha256 = "";
  };

  filterscape = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Filterscape";
    url = "https://dl.u-he.com/releases/Filterscape_151_15664_Linux.tar.xz";
    sha256 = "sha256-aLnLOrJ3VhBYYoqjnMDar0ydO7aX00JZyw+Q4WQPjCo=";
  };

  mfm2 = pkgs.callPackage ./derivations/common-tar.nix {
    name = "MFM2";
    url = "https://dl.u-he.com/releases/MFM2_25_13385_Linux.tar.xz";
    sha256 = "";
  };

  presswerk = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Presswerk";
    url = "https://dl.u-he.com/releases/Presswerk_115_12092_Linux.tar.xz";
    sha256 = "";
  };

  satin = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Satin";
    url = "https://dl.u-he.com/releases/Satin_133_15721_Linux.tar.xz";
    sha256 = "sha256-upsp84NvSLiSCAL9f358A7UUxt2OIpMR5FXeibXOzdk=";
  };

  twangstrom = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Twangstrom";
    url = "https://dl.u-he.com/releases/Twangstrom_101_12092_Linux.tar.xz";
    sha256 = "";
  };

  uhbik = pkgs.callPackage ./derivations/common-tar.nix {
    name = "Uhbik";
    url = "https://dl.u-he.com/releases/Uhbik_131_8256_Linux.tar.xz";
    sha256 = "";
  };
}