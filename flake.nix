{
  description = "flakehub example";

  inputs = {
    flakehub.url = "github:elohmeier/flakehub";
    flakehub.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, flakehub, nixpkgs }: {

    packages.aarch64-linux.my-bash-image = flakehub.packages.aarch64-linux.flakehubTools.streamLayeredImageConf {
      name = "bash-stream-layered";
      contents = [ nixpkgs.legacyPackages.aarch64-linux.bashInteractive ];
    };

    packages.x86_64-linux.my-bash-image = flakehub.packages.x86_64-linux.flakehubTools.streamLayeredImageConf {
      name = "bash-stream-layered";
      contents = [ nixpkgs.legacyPackages.x86_64-linux.bashInteractive ];
    };

  };
}
