{ config, pkgs, userSettings, ... }:
{
	xdg =
	{
		configFile =
		{
			hypr =
			{
				source = "${userSettings.dotfiles}/hypr";
			};
		};
	};
}

