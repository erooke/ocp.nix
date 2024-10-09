{
  buildPythonPackage,
  pythonOlder,
  lib,
  # Buildtime dependencies
  setuptools,
  lib3mf,
}:
let
  pname = "py-lib3mf";
  version = lib3mf.version;
  src = ./.;
in

buildPythonPackage {
  inherit src pname version;
  pyproject = true;

  build-system = [ setuptools ];

  disabled = pythonOlder "3.9";

  patchPhase = ''
    substituteInPlace pyproject.toml py_lib3mf/__init__.py \
      --replace "VERSION" "${version}"

    cp ${lib.getDev lib3mf}/include/lib3mf/Bindings/Python/Lib3MF.py py_lib3mf/
    cp ${lib3mf}/lib/lib3mf.so.${version}.0 py_lib3mf/lib3mf.so
  '';

}
