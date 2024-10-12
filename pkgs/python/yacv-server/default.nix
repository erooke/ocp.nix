{
  fetchFromGitHub,
  buildPythonPackage,
  poetry-core,
  build123d,
  pillow,
  pygltflib,
}:
let
  version = "0.9.0";
  owner = "yeicor-3d";
  repo = "yet-another-cad-viewer";
  rev = "v${version}";
in

buildPythonPackage {
  pname = "yacv_server";
  inherit version;

  src = fetchFromGitHub {
    inherit owner repo rev;
    hash = "sha256-aDQQAHOLN5GEQj3Bg/MVdffbdeR9Pp0LJx5u36+b1Ec=";
  };

  pyproject = true;

  SKIP_BUILD_FRONTEND = "1";

  build-system = [ poetry-core ];

  dependencies = [
    build123d
    pillow
    pygltflib
  ];
}
