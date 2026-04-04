{ config, pkgs, userSettings, ... }:
{
	programs =
	{
		zsh =
		{
			enable = true;
			dotDir = "${config.xdg.configHome}/zsh";
			envExtra = ''
				export DOTDIR="${userSettings.dotfilesDirectory}"
				export SHELL_SESSIONS_DISABLE=1
			'';
			initContent = ''
				[ -f "$UTILSDIR/common" ] && source "$UTILSDIR/common"
				common::add_folder "$UTILSDIR"

				autoload -Uz compinit
				zstyle ':completion:*' menu select
				zstyle ':completion:*' list-colors \'\'
				zstyle ':completion::complete:*' cache-path "${config.xdg.cacheHome}/.zcompcache"

				zmodload zsh/complist
				compinit -d "${config.xdg.cacheHome}/.zcompdump"
				_comp_options+=(globdots)

				autoload -U add-zsh-hook

				common::add_folder "$SHELLDIR/functions"
				common::add_file "$SHELLDIR/shell-aliases"
				common::add_file "$SHELLDIR/shell-secrets"
				common::add_file "$SHELLDIR/shell-work"
				common::add_file "$ZSHDIR/zsh-utils"

				zsh::add_file "zsh-options"
				zsh::add_file "zsh-prompt"
				zsh::add_file "zsh-vcs"
				zsh::add_file "zsh-vim"
				zsh::add_file "zsh-widgets"
			'';
			history =
			{
				size = 12000;
				save = 10000;
				path = "${config.xdg.stateHome}/.zhistory";
			};
			cdpath =
			[
				"$OPEN_SOURCE_PROJECTS"
				"$PRIVATE_PROJECTS"
				"$STUDY_PROJECTS"
				"$WORK_PROJECTS"
			];
		};
	};
}
