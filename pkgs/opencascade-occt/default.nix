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
  version = "7.7.2";
  commit = "V${builtins.replaceStrings [ "." ] [ "_" ] version}";

  src = fetchurl {
    name = "occt-${commit}.tar.gz";
    url = "https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=${commit};sf=tgz";
    sha256 = "sha256-M0G/pJuxsJu5gRk0rIgC173/XxI1ERpmCtWjgr/0dyY=";
  };

  patches = [
    (fetchpatch {
      url = "https://raw.githubusercontent.com/conda-forge/occt-feedstock/00ff0f68644d9582a4c30c01220e7de0f934d427/recipe/patches/blobfish.patch";
      sha256 = "sha256-5tqkx7W7VBw7qaseFgwBENKbGQ0iUYEL6SJHwGI9L/g=";
    })
  ];

  nativeBuildInputs = [
    cmake
    ninja
  ];

  buildInputs =
    [
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

  cmakeFlags =
    [ "-D BUILD_RELEASE_DISABLE_EXCEPTIONS=OFF" ]
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
