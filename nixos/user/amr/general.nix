{ host, user, pkgs, ... }:

{
	home.stateVersion = "22.05";
	programs.home-manager.enable = true;

	home.keyboard.layout = "us,ar";

	# Enable the X11 windowing system.
	xsession.enable = true;
	xsession.numlock.enable = true;

	xdg.configFile.discordConfig = {
		text = ''{ "SKIP_HOST_UPDATE": true }'';
		target = "discord/settings.json";
	};

	programs.direnv = {
		enable = true;
		enableBashIntegration = true;
		# This is enabled by default
		# enableFishIntegration = true;
		nix-direnv.enable = true;
	};

	home.packages = with pkgs; [
		# Browsers
		google-chrome
		firefox

		# Communication
		discord
		tdesktop
		zoom-us

		# Help
		tealdeer # TLDR
		cht-sh

		# Other
		bat
		fd 
		ripgrep
		htop
		btop
		rar
		zip
		unzip
		gimp
		libreoffice

		# Editor
		vscodium
	];
}
