{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      packages.${system} = {
        default = pkgs.stdenv.mkDerivation {
          name = "updreplay";
          buildInputs = [ pkgs.cmake pkgs.libpcap ];
          src = ./.;
        };
      };
    };
}
