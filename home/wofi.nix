{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		wofi =
		{
			enable = true;
		};
	};
	xdg =
	{
		configFile =
		{
			wofi =
			{
				source = "${userSettings.dotfiles}/wofi";
			};
		};
	};
}
