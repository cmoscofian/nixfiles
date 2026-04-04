{ config, pkgs, ... }:
{
	programs =
	{
		gpg =
		{
			enable = true;
			settings =
			{
				keyid-format = "0xlong";
				with-fingerprint = true;
				with-keygrip = true;
				with-subkey-fingerprints = true;
			};
			homedir = "${config.xdg.dataHome}/gnupg";
		};
	};
	services =
	{
		gpg-agent =
		{
			enable = true;
			defaultCacheTtl = 86400;
			maxCacheTtl = 86400;
			pinentry =
			{
				package = pkgs.pinentry-qt;
			};
			enableZshIntegration = true;
		};
	};
}
