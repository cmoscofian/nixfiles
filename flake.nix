{
	description = "DotNix files";

	inputs =
	{
		nixpkgs =
		{
			url = "github:nixos/nixpkgs/nixos-unstable";
		};
		home-manager =
		{
			url = "github:nix-community/home-manager/master";
			inputs =
			{
				nixpkgs =
				{
					follows = "nixpkgs";
				};
			};
		};
		cmoscofian-dotfiles =
		{
			url = "github:cmoscofian/dotfiles/main";
			flake = false;
		};
		cmoscofian-nordvpn-nix =
		{
			url = "github:cmoscofian/nordvpn-nix/main";
			flake = true;
		};
	};

	outputs = input@{ self, nixpkgs, home-manager, cmoscofian-dotfiles, cmoscofian-nordvpn-nix, ... }:
	let
		lib = input.nixpkgs.lib;
		pkgs = input.nixpkgs.legacyPackages.${systemSettings.arch};

		# User custom settings
		userSettings =
		{
			username = "cmoscofian";
			homeDirectory = "/home/${userSettings.username}";
			dotfilesDirectory = "${userSettings.homeDirectory}/.dotfiles";
			dotfiles = input.cmoscofian-dotfiles.outPath;
		};
		 
		# System custom settings
		systemSettings =
		{
			arch = "x86_64-linux";
			hostname = "nixos";
			fileSystem =
			{
				encrypted =
				{
					alias = "luksPRIMARY";
					label = "MAIN";
				};
				boot =
				{
					label = "BOOT";
					type = "vfat";
				};
				root =
				{
					label = "ROOT";
					type = "ext4";
				};
				swap =
				{
					label = "SWAP";
				};
			};
		};
	in
	{
		nixosConfigurations =
		{
			nixos = lib.nixosSystem
			{
				system = systemSettings.arch;
				specialArgs =
				{
					inherit systemSettings;
					inherit userSettings;
				};
				modules =
				[
					cmoscofian-nordvpn-nix.nixosModules.default
					./system/index.nix
				];
			};
		};
		homeConfigurations =
		{
			cmoscofian = input.home-manager.lib.homeManagerConfiguration
			{
				inherit pkgs;
				extraSpecialArgs =
				{
					inherit userSettings;
				};
				modules = [ ./home/index.nix ];
			};
		};
	};
}
