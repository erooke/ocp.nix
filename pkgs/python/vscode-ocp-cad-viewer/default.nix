{
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  pytestCheckHook,
  ocp-tessellate,
  requests,
  ipykernel,
  orjson,
  websockets,
  pyaml,
  flask,
  flask-sock,
  click,
  build123d,
}:
let
  version = "2.6.1";
  owner = "bernhard-42";
  repo = "vscode-ocp-cad-viewer";
  rev = "v${version}";
in

buildPythonPackage {
  pname = "ocp_vscode";
  inherit version;

  src = fetchFromGitHub {
    inherit owner repo rev;
    hash = "sha256-Rf5MgyE25TeUQwRee/icW/FOEwuwznRIHA5p3ZrUaaM=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [
    ocp-tessellate
    requests
    ipykernel
    orjson
    websockets
    pyaml
    flask
    flask-sock
    click
  ];

  nativeCheckInputs = [
    pytestCheckHook
    build123d
  ];

  # The tests attempt to write to home directory...
  doCheck = false;

}
