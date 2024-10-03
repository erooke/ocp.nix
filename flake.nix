{
  description = "OCP Ecosystem packaged for nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      overlay = import ./pkgs/overlay.nix;
      pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      overlays.default = overlay;
    };
}
