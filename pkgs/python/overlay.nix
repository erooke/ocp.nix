{
  casadi,
  llvmPackages_15,
  ocp,
}:
final: prev: {
  cadquery = final.callPackage ./cadquery { };
  casadi = final.toPythonModule (casadi.override { pythonSupport = true; });
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  nlopt = final.callPackage ./nlopt { };
  ocp = final.callPackage ./ocp { inherit ocp; };
  pywrap = final.callPackage ./pywrap { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
}
