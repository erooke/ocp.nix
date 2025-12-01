{
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  lib,
  numpy,
  ocp,
  scipy,
  setuptools,
  setuptools-scm,
}:
let
  pname = "ocp-gordon";
  version = "0.1.18";
  src = fetchFromGitHub {
    inherit version pname;
    rev = "v${version}";
    owner = "gongfan99";
    repo = "ocp_gordon";
    hash = "sha256-s7ui6KhARiuxEAIGBuey+UDwW6zY5jHFSGbjnSDATQw=";
  };
in
buildPythonPackage {
  inherit src pname version;
  pyproject = true;

  patchPhase = ''
    substituteInPlace pyproject.toml \
      --replace "cadquery-ocp" "ocp"
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  dependencies = [
    numpy
    scipy
    ocp
  ];
}
