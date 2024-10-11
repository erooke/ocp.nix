{
  stdenv,
  fetchFromGitHub,
  cmake,
  llvm_15,
  llvmPackages_15,
  vtk,
  python3,
  rapidjson,
  opencascade-occt,
}:
let
  pywrap-env = python3.withPackages (ps: [
    ps.pywrap
    ps.lief
    ps.logzero
  ]);
in
stdenv.mkDerivation {

  name = "OCP";

  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = "OCP";
    rev = "7.7.2.1";
    hash = "sha256-jXkIzI4xz5BNoyptzr75GR5ZKHrTig4NgSg7ynHH9gk=";
  };

  patches = [
    ./out.patch
  ];

  nativeBuildInputs = [
    cmake
    pywrap-env
  ];

  preBuild = ''
    cp -r ../opencascade ./opencascade
  '';

  buildInputs = [
    opencascade-occt
    llvmPackages_15.libclang.dev
    llvm_15
    vtk
    rapidjson
  ] ++ vtk.buildInputs ++ opencascade-occt.buildInputs;

  preConfigure = ''
    cmakeFlagsArray+=(
      -DN_PROC="''${NIX_BUILD_CORES}"
    )
  '';
}
