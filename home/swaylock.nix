{ config, pkgs, ... }:
{
	programs =
	{
		swaylock =
		{
			enable = true;
			package = pkgs.swaylock-effects;
			settings =
			{
				screenshots = true;
				ignore-empty-password = true;
				show-failed-attempts = true;
				show-keyboard-layout = true;
				indicator-caps-lock = true;
				clock = true;
				effect-blur = "10x3";
				effect-vignette = "0.3:0.3";
			};
		};
	};
}
