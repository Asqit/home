{
  description = "Andy's PC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # zen-garden = hostname
        zen-garden = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/zen-garden/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "hm-backup";
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.andy = import ./hosts/zen-garden/home.nix;
              };
            }
          ];
        };
      };
    };
}
