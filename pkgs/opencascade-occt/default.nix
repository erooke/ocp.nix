{
  lib,
  fetchpatch,
  stdenv,
  fetchurl,
  cmake,
  ninja,
  tcl,
  tk,
  libGL,
  libGLU,
  libXext,
  libXmu,
  libXi,
  darwin,
  vtk,
  enableVtk ? false,
  rapidjson,
  enableRapidJson ? false,
  freeimage,
  enableFreeimage ? false,
}:
stdenv.mkDerivation rec {
  pname = "opencascade-occt";
  version = "7.8.1";
  commit = "V${builtins.replaceStrings [ "." ] [ "_" ] version}";

  src = fetchurl {
    name = "occt-${commit}.tar.gz";
    url = "https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=${commit};sf=tgz";
    sha256 = "sha256-AGMZqTLLjXbzJFW/RSTsohAGV8sMxlUmdU/Y2oOzkk8=";
  };

  patches =
    let
      root = "https://raw.githubusercontent.com/conda-forge/occt-feedstock/74f888432c34c2ac43249823bf6c4d205af32d8d/recipe/patches";
      patches = [
        {
          name = "0001-cmake-Don-t-try-to-write-to-install-directory.-You-k";
          hash = "sha256-oaProXd1JGlQgAH7mOlp3VuqKaSwZyuW7xlijOoEUzY=";
        }
        {
          name = "0002-GeomPlate_BuildAveragePlane-BasePlan-Don-t-set-yvect";
          hash = "sha256-44X0xl4NLzrizV+1nbTKz+w6PcrUsVsqwTJKyTrhz90=";
        }
        {
          name = "0003-BRepFill_Filling-WireFromList-We-can-t-assume-that-a";
          hash = "sha256-CByTdxpQ5hWaNSnzIBIH47Brj4y5Uu5S4apFFVX0X44=";
        }
        {
          name = "0004-BRepFill_Filling-Curve-constraints-confused-by-impli";
          hash = "sha256-LbnC/lUW63LbqclrXD5SYAqJssy4LQWhPiM/ZVGL52s=";
        }
        {
          name = "0005-BRepFill_Filling-Don-t-even-attempt-to-build-with-em";
          hash = "sha256-GPeUvhpsgIiijpI3C871x28q1om+rlwzUl284W0XVxI=";
        }
        {
          name = "0006-BRepOffset_Tool-TryProject-Check-return-of-BRepLib-B";
          hash = "sha256-+BwWXp4LQwPNeTHhVbjCLKvAKwlQX6iOJq1zxn7W44U=";
        }
        {
          name = "0007-ChFi3d_Builder-ChFi3d_ComputeCurves-set-tolreached-f";
          hash = "sha256-cnrtI1kujzYRpT0qNxWsAZvC4oMkcUqDC+XU+W0VRCY=";
        }
        {
          name = "0008-BRepLib-MakeEdge-Setting-closed-flag-of-generated-ed";
          hash = "sha256-5FGryRl8LdxbxmZtUmXDbVMD9nt7XiU4puGSp/JQ9OI=";
        }
        {
          name = "0009-BRepFill_CompatibleWires-segfault.-See-following";
          hash = "sha256-UlEaLz7uMu0klNbYS8CyYgAmJ0RbyeZUl1CgOSCom4U=";
        }
        {
          name = "0010-BRepFill_OffsetWire-segfault.-See-following";
          hash = "sha256-TYFQyK5A1E/El+i9SQd+s7fo4xpyHUsHsKYDK7OxKnc=";
        }
        {
          name = "0011-ChFiDS_FilSpine-Allow-usage-of-externally-assigned-l";
          hash = "sha256-qfUOfkOP26OVVgaVEwbWTqARTpxBcdDiFOXbVvmJ6ic=";
        }
        {
          name = "0013-BRepFill_PipeShell-Fix-segfault-with-line-as-profile";
          hash = "sha256-SCIXXzmMSsxh5B4/s6Hi4JC4/I3/+LQzk7tvibLml34=";
        }
        {
          name = "0015-build-Expand-preprocessor-conditional-on-non-standar";
          hash = "sha256-0ar6dyFQUOJvWDPYRSlk1eMrxyKIZtXtWMuG50TIuxw=";
        }
        {
          name = "0016-IntPatch_Intersection-Consider-intersection-of-a-clo";
          hash = "sha256-zTCfuckptku0ohbK4DHZDo+OUGg4JPmhvpmjN/BpCu4=";
        }
        {
          name = "0017-ChFi3d_Builder-Fix-blend-across-seam.-See-following";
          hash = "sha256-Q3zsTuVC8h8JUUVKojSCqoespGtX5i6ptuTVqSOErq0=";
        }
        {
          name = "0018-Fix-0033576-BRepTools_NurbsConvertModification-NewPo";
          hash = "sha256-mQMq+n1eCTYn8lBHJtdAtY9gtcqyrL3596zcBTOyXW4=";
        }
      ];
    in
    builtins.map (
      { name, hash }:
      (fetchpatch {
        url = "${root}/${name}.patch";
        sha256 = hash;
      })
    ) patches;

  nativeBuildInputs = [
    cmake
    ninja
  ];

  buildInputs = [
    tcl
    tk
    libGL
    libGLU
    libXext
    libXmu
    libXi
  ]
  ++ lib.optional enableVtk [ vtk ]
  ++ lib.optional enableRapidJson [ rapidjson ]
  ++ lib.optional enableFreeimage [ freeimage ]
  ++ lib.optional stdenv.isDarwin darwin.apple_sdk.frameworks.Cocoa;

  NIX_CFLAGS_COMPILE = [ "-fpermissive" ];

  cmakeFlags = [
    "-D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF"
    (lib.cmakeFeature "CMAKE_POLICY_VERSION_MINIMUM" "3.5")
  ]
  ++ lib.optional enableFreeimage [
    "-D USE_FREEIMAGE:BOOL=ON"
  ]
  ++ lib.optional enableRapidJson [
    "-D USE_RAPIDJSON:BOOL=ON"
  ]
  ++ lib.optional enableVtk [
    "-D USE_VTK=ON"
    "-D 3RDPARTY_VTK_LIBRARY_DIR:FILEPATH=${vtk}/lib"
    "-D 3RDPARTY_VTK_INCLUDE_DIR:FILEPATH=${vtk}/include/vtk"
  ];

  meta = with lib; {
    description = "Open CASCADE Technology, libraries for 3D modeling and numerical simulation";
    homepage = "https://www.opencascade.org/";
    license = licenses.lgpl21; # essentially...
    # The special exception defined in the file OCCT_LGPL_EXCEPTION.txt
    # are basically about making the license a little less share-alike.
    maintainers = with maintainers; [
      amiloradovsky
      gebner
    ];
    platforms = platforms.all;
  };

}
