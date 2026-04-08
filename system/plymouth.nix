{ config, lib, pkgs, ... }:
{
	boot =
	{
		plymouth =
		{
			enable = true;
			theme = "circle_hud";
			themePackages = with pkgs; [
				(adi1090x-plymouth-themes.override { selected_themes = [ "circle_hud" ]; })
			];
		};
		consoleLogLevel = 3;
		initrd =
		{
			systemd =
			{
				enable = true;
			};
			verbose = false;
		};
		kernelParams =
		[
			"quiet"
			"splash"
			"udev.log_level=3"
			"systemd.show_status=auto"
		];
		loader =
		{
			timeout = 0;
		};
	};
}
