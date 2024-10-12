{
  fetchFromGitHub,
  buildPythonPackage,
  cadquery,
  cq-kit,
  setuptools,
  pytestCheckHook,
}:
let
  version = "0.5.6";
in
buildPythonPackage {
  pname = "cq-gridfinity";
  inherit version;

  src = fetchFromGitHub {
    owner = "michaelgale";
    repo = "cq-gridfinity";
    rev = "v.${version}";
    hash = "sha256-P5fXTs2ImNI5Bt4DwNHTJPfFLV0Q8XIKu9vHgmVDnpQ=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [
    cq-kit
    cadquery
  ];

  nativeCheckInputs = [ pytestCheckHook ];
}
