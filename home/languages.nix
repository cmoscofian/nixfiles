{ config, pkgs, ...}:
{
	programs =
	{
		gcc =
		{
			enable = true;
		};
		go =
		{
			enable = true;
			env =
			{
				GOPATH =
				[
					"${config.xdg.dataHome}/go"
				];
			};
		};
		java =
		{
			enable = true;
		};
	};
}
