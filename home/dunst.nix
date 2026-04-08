{ config, pkgs, ... }:
{
	services =
	{
		dunst =
		{
			enable = true;
			settings =
			{
				global =
				{
					monitor = 0;
					follow = "none";
					width = "(175, 300)";
					height = "(0, 100)";
					origin = "top-right";
					offset = "(10, 30)";
					scale = 0;
					notification_limit = 0;
					progress_bar = true;
					progress_bar_height = 10;
					progress_bar_frame_width = 1;
					progress_bar_min_width = 150;
					progress_bar_max_width = 300;
					indicate_hidden = true;
					transparency = 20;
					separator_height = 1;
					frame_color = "#c0c0c0";
					gap_size = 3;
					separator_color = "frame";
					sort = true;
					font = "AdwaitaMono Nerd Font 9";
					line_height = 0;
					markup = "full";
					format = "<b>%s</b>\n%b";
					alignment = "right";
					vertical_alignment = "center";
					show_age_threshold = 30;
					ellipsize = "end";
					ignore_newline = false;
					stack_duplicates = true;
					hide_duplicate_count = false;
					show_indicators = true;
					enable_recursive_icon_lookup = true;
					icon_position = "left";
					min_icon_size = 32;
					max_icon_size = 64;
					sticky_history = true;
					history_length = 20;
					dmenu = "${pkgs.wofi}/bin/wofi --show dmenu --prompt 'dunst: ' --width 400 --lines 10";
					browser = "${pkgs.firefox}/bin/firefox";
					always_run_script = true;
					title = "dunst";
					class = "dunst";
					corner_radius = 3;
					ignore_dbusclose = false;
					force_xwayland = true;
					force_xinerama = false;
					mouse_left_click = "close_current";
					mouse_middle_click = "close_all";
					mouse_right_click = "open_url";
				};

				experimental =
				{
					per_monitor_dpi = false;
				};

				urgency_low =
				{
					background = "#ffffff";
					foreground = "#000000";
					timeout = 3;
				};

				urgency_normal =
				{
					background = "#ffffff";
					foreground = "#000000";
					timeout = 5;
				};

				urgency_critical =
				{
					background = "#800000";
					foreground = "#ffffff";
					timeout = 0;
				};
			};
		};
	};
}
