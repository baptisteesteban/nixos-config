{
  perSystem = {pkgs, ...}: let
    spot = pkgs.stdenv.mkDerivation rec {
      pname = "spot";
      version = "2.15.1";

      src = pkgs.fetchurl {
        url = "http://www.lre.epita.fr/dload/spot/spot-${version}.tar.gz";
        sha512 = "0mfrg7w0cwzww1j2aj5nic4b6y4w9wmd08y47alr4m0i8qkcidx0iw71xl5arwzzl8p92msir4ki7r5g0sd7py4ykfqqdbsg6g0hyph";
      };

      buildInputs = [pkgs.python3];

      enableParallelBuilding = true;
    };
  in {
    packages.spot = spot;
    packages.spot-python = pkgs.python3.withPackages (_: [(pkgs.python3.pkgs.toPythonModule spot)]);
  };
}
