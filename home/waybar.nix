{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		waybar =
		{
			enable = true;
		};
	};
	xdg =
	{
		configFile =
		{
			waybar =
			{
				source = "${userSettings.dotfiles}/waybar";
			};
		};
	};
}

