{
  casadi,
  llvmPackages_15,
}:
final: prev: {
  casadi = final.toPythonModule (casadi.override { pythonSupport = true; });
  libclang = prev.libclang.override { llvmPackages = llvmPackages_15; };
  nlopt = final.callPackage ./nlopt { };
  pywrap = final.callPackage ./pywrap { };
  svgpathtools = final.callPackage ./svgpathtools { };
  trianglesolver = final.callPackage ./trianglesolver { };
}
