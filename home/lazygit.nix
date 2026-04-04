{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		lazygit =
		{
			enable = true;
			enableZshIntegration = true;
		};
	};
	xdg =
	{
		configFile =
		{
			lazygit =
			{
				source = "${userSettings.dotfiles}/lazygit";
			};
		};
	};
}
