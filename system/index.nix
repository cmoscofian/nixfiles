{ config, lib, pkgs, userSettings, systemSettings, ... }:
{
	imports =
	[
		./hardware-configuration.nix
		./plymouth.nix
		"${systemSettings.nordvpn}/nordvpn-module.nix"
	];

	boot =
	{
		loader =
		{
			grub =
			{
				enable = true;
				device = "nodev";
				efiSupport = true;
			};
			efi =
			{
				canTouchEfiVariables = true;
			};
		};
	};

	networking =
	{
		hostName = "${systemSettings.hostname}";
		networkmanager =
		{
			enable = true;
		};
	};

	hardware =
	{
		bluetooth =
		{
			enable = true;
		};
	};

	nix =
	{
		settings =
		{
			experimental-features = [ "nix-command" "flakes" ];
		};
	};

	time =
	{
		timeZone = "Europe/Stockholm";
	};

	users =
	{
		defaultUserShell = pkgs.zsh;
		users =
		{
			${userSettings.username} =
			{
				isNormalUser = true;
				extraGroups = [ "wheel" "nordvpn" ];
				packages = [];
			};
		};
	};

	programs =
	{
		firefox =
		{
			enable = true;
		};
		git =
		{
			enable = true;
		};
		gnupg =
		{
			agent =
			{
				enable = true;
			};
		};
		hyprland =
		{
			enable = true;
		};
		hyprlock =
		{
			enable = true;
		};
		nm-applet =
		{
			enable = true;
		};
		ssh =
		{
			startAgent = true;
		};
		tmux =
		{
			enable = true;
		};
		vim =
		{
			enable = true;
			defaultEditor = true;
		};
		zsh =
		{
			enable = true;
		};
	};

	environment =
	{
		shells = with pkgs;
		[
			zsh
		];
		systemPackages = with pkgs;
		[
			alacritty
			brightnessctl
			cryptsetup
			curl
			dunst
			flatpak
			openssl_3
			pcmanfm
			pinentry-qt
			pulsemixer
			wdisplays
			wl-clipboard
			wofi
		];
	};

	fonts =
	{
		packages = with pkgs;
		[
			nerd-fonts.adwaita-mono
		];
	};

	services =
	{
		displayManager =
		{
			ly =
			{
				enable = true;
				settings =
				{
					allow_empty_password = false;
					animation = "matrix";
					auth_fails = 3;
					clear_password = true;
				};
			};
		};
		flatpak =
		{
			enable = true;
		};
	};

	nixpkgs =
	{
		config =
		{
			allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg)
			[
				"nordvpn"
			];
		};
	};

	custom =
	{
		services =
		{
			nordvpn =
			{
				enable = true;
			};
		};
	};

	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#'
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system =
	{
		stateVersion = "25.11"; # Did you read the comment?
	};
}
