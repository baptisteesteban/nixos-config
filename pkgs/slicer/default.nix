{
  pkgs,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  ...
}: let
  version = "5.10.0";
in
  stdenv.mkDerivation {
    inherit version;
    pname = "slicer";

    src = fetchurl {
      name = "slicer.tar.gz";
      url = "https://download.slicer.org/bitstream/6911b598ac7b1c95e7934427";
      sha512 = "2ea56b6f0c027fa73c832b23c34948e69b1b5124edf337a35f6a062f5cb78e7feb792c11bc02a4986f26e458ddfd954b00255953018bf6cc7d73834aba9f0267";
    };

    nativeBuildInputs = [
      autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      glib
      libxkbcommon
      zlib
      pcre2
      libGL
      libGLU
      libx11
      libxext
      libxcomposite
      libxdamage
      libxfixes
      libxi
      libxcursor
      libxtst
      libsm
      libice
      libxrandr
      libxrender
      libxcrypt-legacy
      libxcb
      libxcb-image
      libxcb-keysyms
      libxcb-render-util
      libxcb-wm
      pulseaudio
      cups
      fontconfig
      freetype
      postgresql
      psqlodbc
      alsa-lib
      nss
      hwloc.lib
    ];
    autoPatchelfIgnoreMissingDeps = ["libhwloc.so.5"];

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/Slicer
      cp -r . $out/Slicer

      mkdir -p $out/share/applications
      cat > $out/share/applications/Slicer.desktop << EOF
      [Desktop Entry]
      Name = 3D Slicer
      Exec=$out/Slicer/Slicer
      Type=Application
      Terminal=false
    '';
  }
