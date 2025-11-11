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
  trame,
  trame-vtk,
}:
buildPythonPackage {
  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = "cadquery";
    rev = "v2.6.1";
    hash = "sha256-ZIZ49RCGkPztlhU/AmDFnJXvw5kuhF+sSLKZuXMtuCU=";
  };
  pname = "cadquery";
  version = "2.6.1";
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
    trame
    trame-vtk
  ];

  nativeCheckInputs = [
    pytestCheckHook
    ipython
    docutils
  ];

}
