{ host, user, ... }:

{
	imports = [
		{ _module.args = { inherit host user; }; }
		./general.nix
		./git.nix
        	./shell.nix
	];
}
