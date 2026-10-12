{ config, pkgs, userSettings, ... }:
{
	xdg =
	{
		configFile =
		{
			mango =
			{
				source = "${userSettings.dotfiles}/mango";
			};
		};
	};
}


