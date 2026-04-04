{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		git =
		{
			enable = true;
			includes =
			[
				{
					path = "${config.xdg.configHome}/git/work/config";
					condition = "gitdir:~/Workspace/work/projects/";
				}
			];
		};
	};
	xdg =
	{
		configFile =
		{
			git =
			{
				source = "${userSettings.dotfiles}/git";
			};
		};
	};
}
