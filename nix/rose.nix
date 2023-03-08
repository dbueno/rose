{ gccStdenv, lib, callPackage, fetchFromGitHub
, autoconf, automake, libtool, pkg-config
, boost
}:

gccStdenv.mkDerivation rec {
  pname = "rose";
  src = ./..;
  version = "release";

  patches = [];

  preConfigure = ''
    ./build
  '';

  nativeBuildInputs = [
    autoconf
    automake
    libtool
    pkg-config
    boost
  ];
}
