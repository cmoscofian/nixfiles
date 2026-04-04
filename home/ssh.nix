{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		ssh =
		{
			enable = true;
			enableDefaultConfig = false;
			matchBlocks =
			{
				"*" =
				{
					addKeysToAgent = "yes";
					identitiesOnly = true;
				};
				"github.com" =
				{
					hostname = "github.com";
					user = "git";
					identityFile = "${userSettings.homeDirectory}/.ssh/keys/personal";
				};
				"personal.github.com" =
				{
					hostname = "personal.github.com";
					user = "git";
					identityFile = "${userSettings.homeDirectory}/.ssh/keys/personal";
				};
			};
		};
	};
}
