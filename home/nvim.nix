{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		neovim =
		{
			enable = true;
			defaultEditor = true;
			extraPackages = with pkgs;
			[
				tree-sitter
			];
			plugins = with pkgs.vimPlugins; [
				nvim-cmp
				cmp-nvim-lsp
				nvim-dap
				nvim-dap-view
				gitsigns-nvim
				nvim-jdtls
				lazygit-nvim
				luasnip
				cmp_luasnip
				nvim-nio
				plenary-nvim
				telescope-nvim
				nvim-treesitter
				{
					plugin = one-small-step-for-vimkind;
					optional = true;
				}
			];
			waylandSupport = true;
		};
	};
	xdg =
	{
		configFile =
		{
			nvim =
			{
				source = builtins.filterSource (path: type: baseNameOf path != "treesitter.lua") "${userSettings.dotfiles}/nvim";
			};
		};
	};
}
