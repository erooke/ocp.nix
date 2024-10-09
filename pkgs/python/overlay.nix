{
  casadi,
  llvmPackages_15,
  ocp,
}:
final: prev: {
  build123d = final.callPackage ./build123d { };
  cadquery = final.callPackage ./cadquery { };
  casadi = final.toPythonModule (casadi.override { pythonSupport = true; });
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  nlopt = final.callPackage ./nlopt { };
  ocp = final.callPackage ./ocp { inherit ocp; };
  ocpsvg = final.callPackage ./ocpsvg { };
  py-lib3mf = final.callPackage ./py-lib3mf { };
  pywrap = final.callPackage ./pywrap { };
  qtconsole = final.callPackage ./qtconsole { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
}
