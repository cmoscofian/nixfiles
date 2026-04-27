{ config, pkgs, userSettings, ... }:
let
	nibble-vim = pkgs.vimUtils.buildVimPlugin
	{
		name = "nibble-vim";
		pname = "nibble-vim";
		src = pkgs.fetchFromGitHub {
			owner = "cmoscofian";
			repo = "nibble-vim";
			rev = "main";
			sha256 = "pAnR+3h1eqlxOAXLE9LYUVL08FtaWNI2s/HZI7Da7eU=";
		};
	};
in
{
	programs =
	{
		vim =
		{
			enable = true;
			plugins = with pkgs.vimPlugins;
			[
				nerdtree
				nibble-vim
			];
		};
	};
	xdg =
	{
		configFile =
		{
			vim =
			{
				source = "${userSettings.dotfiles}/vim";
			};
		};
	};
}
