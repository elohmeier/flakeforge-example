{
  description = "flakeforge example";

  inputs = {
    flakeforge.url = "github:elohmeier/flakeforge";
    flakeforge.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, flakeforge, nixpkgs }: {

    packages.aarch64-linux.my-bash-image = flakeforge.packages.aarch64-linux.flakeforgeTools.streamLayeredImageConf {
      name = "bash-stream-layered";
      contents = [ nixpkgs.legacyPackages.aarch64-linux.bashInteractive ];
    };

    packages.x86_64-linux.my-bash-image = flakeforge.packages.x86_64-linux.flakeforgeTools.streamLayeredImageConf {
      name = "bash-stream-layered";
      contents = [ nixpkgs.legacyPackages.x86_64-linux.bashInteractive ];
    };

  };
}
