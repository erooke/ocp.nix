{
  fontconfig,
  fetchzip,
  stdenv,
  cmake,
  vtk,
  python3,
  rapidjson,
  opencascade-occt,
  tk,
  libGL,
}:
let
  python = python3.withPackages (ps: [
    ps.pybind11
  ]);
  version = "7.8.1.1";
in
stdenv.mkDerivation {
  pname = "OCP";
  inherit version;

  src = fetchzip {
    url = "https://github.com/CadQuery/OCP/releases/download/${version}/OCP_src_stubs_ubuntu-20.04.zip";
    hash = "sha256-7X6xsJe9eDqbDfur20gB4Fkgtm94soFfRqicUI5jsjM=";
  };

  nativeBuildInputs = [
    cmake
    python
  ];

  buildInputs = [
    libGL
    fontconfig
    opencascade-occt
    rapidjson
    vtk
    tk
  ];

}
