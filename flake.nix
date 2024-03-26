{
  description = "My NIXOS Config!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  {
    nixosConfigurations."black-eagle" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            ./configurations/configuration.nix
        ];
    };
  };
}
