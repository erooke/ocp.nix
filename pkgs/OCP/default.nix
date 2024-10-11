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
}:
let
  python = python3.withPackages (ps: [
    ps.pybind11
  ]);
  version = "7.7.2.1";
in
stdenv.mkDerivation {
  pname = "OCP";
  inherit version;

  src = fetchzip {
    url = "https://github.com/CadQuery/OCP/releases/download/${version}/OCP_src_stubs_ubuntu-20.04.zip";
    hash = "sha256-e/k93gQKoDB+GY191Qbs1fXH7DcNSN9xE8oyFlfnosc=";
  };

  nativeBuildInputs = [
    cmake
    python
  ];

  buildInputs = [
    fontconfig
    opencascade-occt
    rapidjson
    vtk
    tk
  ];

}
