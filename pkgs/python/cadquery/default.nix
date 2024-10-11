{
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  ocp,
  ezdxf,
  multimethod,
  nlopt,
  nptyping,
  casadi,
  path,
  typish,
  pytestCheckHook,
  ipython,
  docutils,
}:
buildPythonPackage {
  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = "cadquery";
    rev = "2.4.0";
    hash = "sha256-f/qnq5g4FOiit9WQ7zs0axCJBITcAtqF18txMV97Gb8=";
  };
  pname = "cadquery";
  version = "2.4.0";
  pyproject = true;

  build-system = [ setuptools ];

  patchPhase = ''
    substituteInPlace setup.py \
      --replace "cadquery-ocp" "ocp"
  '';

  pythonRelaxDeps = [
    "nptyping"
  ];

  pythonRemoveDeps = [
    "nlopt"
    "casadi"
  ];

  dependencies = [
    casadi
    ezdxf
    multimethod
    nlopt
    nptyping
    ocp
    path
    typish
  ];

  nativeCheckInputs = [
    pytestCheckHook
    ipython
    docutils
  ];

}
