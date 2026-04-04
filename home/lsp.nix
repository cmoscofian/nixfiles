{ config, pkgs, ... }:
{
	home = {
		packages = with pkgs; [
			gopls
			jdt-language-server
			lua-language-server
			nil
			nixfmt
			vscode-langservers-extracted
		];
	};
}
