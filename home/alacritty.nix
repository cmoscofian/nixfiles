{ config, pkgs, ... }:
{
	programs =
	{
		alacritty =
		{
			enable = true;
			settings =
			{
				colors =
				{
					normal =
					{
						black   = "#000000";
						red     = "#800000";
						green   = "#008000";
						yellow  = "#808000";
						blue    = "#000080";
						magenta = "#800080";
						cyan    = "#008080";
						white   = "#c0c0c0";
					};

					bright =
					{
						black   = "#808080";
						red     = "#ff0000";
						green   = "#00ff00";
						yellow  = "#ffff00";
						blue    = "#0000ff";
						magenta = "#ff00ff";
						cyan    = "#00ffff";
						white   = "#ffffff";
					};

					primary =
					{
						background = "#ffffff";
						foreground = "#000000";
					};
				};

				cursor =
				{
					blink_interval = 350;
					blink_timeout = 0;
					style =
					{
						blinking = "on";
					};
				};

				env =
				{
					TERM = "xterm-256color";
				};

				font =
				{
					size = 13;
					normal = {
						family = "AdwaitaMono Nerd Font";
						style = "Regular";
					};
				};

				selection =
				{
					save_to_clipboard = true;
				};

				terminal =
				{
					shell =
					{
						program = "${pkgs.zsh}/bin/zsh";
					};
				};

				window =
				{
					class =
					{
						general = "alacritty";
						instance = "alacritty";
					};
					padding =
					{
						x = 1;
						y = 1;
					};
				};
			};
		};
	};
}
