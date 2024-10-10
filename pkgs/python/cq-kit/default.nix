{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
  cadquery,
  rich,
}:
let
  version = "0.5.8";
in
buildPythonPackage {
  inherit version;
  pname = "cq-kit";

  src = fetchFromGitHub {
    owner = "michaelgale";
    repo = "cq-kit";
    rev = "v.${version}";
    hash = "sha256-opk2eESaZoel9Oc8UYi7DsDnMJf623twQ77DHHLzfHo=";
  };

  pyproject = true;

  build-system = [ setuptools ];

  dependencies = [ cadquery ];

  nativeCheckInputs = [
    pytestCheckHook
    rich
  ];
}
