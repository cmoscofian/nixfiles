{ config, pkgs, ... }:
{
	home =
	{
		packages = with pkgs; [
			clang-tools
			gopls
			jdt-language-server
			lua-language-server
			nil
			nixfmt
			vscode-langservers-extracted
		];
	};
}
