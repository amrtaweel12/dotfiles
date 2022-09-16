{
	description = "NixOS Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		home-manager.url = "github:nix-community/home-manager";
	};

	outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
	let
		util = import ./nixos/util { inherit nixpkgs home-manager; };

		users = {
			amr = util.mkUser {
				username = "amr";
				fullName = "Amr Taweel";
				email = "amrtaweel111@gmail.com";
				system = "x86_64-linux";
				shell = "fish";
			};
		};
	in {
		nixosConfigurations = {
			nixos = util.mkHost {
				hostName = "nixos";
				system = "x86_64-linux";
				users = [ users.amr ];
				timezone = "Asia/Jerusalem";
			};
		};
	};
}
