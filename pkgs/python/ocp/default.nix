{
  buildPythonPackage,
  ocp,
  setuptools,
  writeText,
  vtk,
  breakpointHook,
}:
let
  pname = "OCP";
  version = "7.7.2.1";
  setup_py = writeText "setup.py" ''
    from setuptools import setup

    setup(
        name='${pname}',
        version="${version}",
        packages=[""],
        package_dir={"": '.'},
        package_data={"": ["*.so"]},
    )
  '';
in
buildPythonPackage {
  src = "${ocp}/site-packages";

  inherit version pname;

  pyproject = true;

  nativeBuildInputs = [ breakpointHook ];

  postPatch = ''
    ln -s ${setup_py} ./setup.py
  '';

  build-system = [ setuptools ];

  dependencies = [
    vtk
  ];

  pythonImportsCheck = [
    "OCP"
    "OCP.gp"
  ];

}
