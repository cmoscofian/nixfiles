{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		k9s =
		{
			enable = true;
		};
	};
	xdg =
	{
		configFile =
		{
			k9s =
			{
				source = "${userSettings.dotfiles}/k8s/k9s";
			};
		};
	};
}
