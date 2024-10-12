{
  fetchzip,
  writeShellScriptBin,
  httplz,
}:
let
  frontend = fetchzip {
    url = "https://github.com/yeicor-3d/yet-another-cad-viewer/releases/download/v0.8.11/frontend.zip";
    hash = "sha256-J57XPF3/1i/DlHYaR06xw6mTWAu8HW7wxFLRtJGl23w=";
  };
in
writeShellScriptBin "yacv-frontend" "${httplz}/bin/httplz ${frontend}"
