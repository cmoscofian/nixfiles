{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		tmux =
		{
			enable = true;
		};
	};
	xdg =
	{
		configFile =
		{
			tmux =
			{
				source = "${userSettings.dotfiles}/tmux";
			};
		};
	};
}
