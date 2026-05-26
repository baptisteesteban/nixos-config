{
  perSystem = {pkgs, ...}: {
    packages.glucose = pkgs.stdenv.mkDerivation rec {
      pname = "glucose";
      version = "4.2.1";
      src = pkgs.fetchurl {
        url = "https://github.com/audemard/glucose/archive/refs/tags/${version}.tar.gz";
        sha512 = "1q66c3zlmpc4ksdzcir34aispq6kwb3izlrcams4f3glw0glpny5y940zf24d4sxcll2yf03kmi5wwhqkijnmvyaadrdn2zjs2ssk4s";
      };
      buildInputs = [pkgs.zlib];
      nativeBuildInputs = with pkgs; [cmake ninja];

      enableParallelBuilding = true;

      configurePhase = ''
        cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.23
      '';
      installPhase = ''
        mkdir -p $out/bin
        mv glucose-syrup $out/bin/glucose
      '';
    };
  };
}
