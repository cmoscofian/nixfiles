{ config, pkgs, userSettings, ... }:
let
	workspaceDirectory = "${userSettings.homeDirectory}/Workspace";
	openSourceDirectory = "${workspaceDirectory}/open-source";
	privateDirectory = "${workspaceDirectory}/private";
	studyDirectory = "${workspaceDirectory}/study";
	workDirectory = "${workspaceDirectory}/work";
in
{
	imports =
	[
		./alacritty.nix
		./dunst.nix
		./fzf.nix
		./git.nix
		./gnupg.nix
		./hyprland.nix
		./k9s.nix
		./languages.nix
		./lazygit.nix
		./lsp.nix
		./nvim.nix
		./ssh.nix
		./swaylock.nix
		./tmux.nix
		./vim.nix
		./waybar.nix
		./wofi.nix
		./zsh.nix
	];

	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home =
	{
		username = "${userSettings.username}";
		homeDirectory = "${userSettings.homeDirectory}";

		# This value determines the Home Manager release that your configuration is
		# compatible with. This helps avoid breakage when a new Home Manager release
		# introduces backwards incompatible changes.
		#
		# You should not change this value, even if you update Home Manager. If you do
		# want to update the value, then make sure to first check the Home Manager
		# release notes.
		stateVersion = "26.05"; # Please read the comment before changing.

		# The home.packages option allows you to install Nix packages into your
		# environment.
		packages = with pkgs;
		[
			bluetui
			freecad
			pulsemixer
			ripgrep
		];

		# Home Manager is pretty good at managing dotfiles. The primary way to manage
		# plain files is through 'home.file'.
		file =
		{
		};

		# Home Manager can also manage your environment variables through
		# 'home.sessionVariables'. These will be explicitly sourced when using a
		# shell provided by Home Manager. If you don't want to manage your shell
		# through Home Manager then you have to manually source 'hm-session-vars.sh'
		sessionVariables =
		{

			# Set aws config env variables
			AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";

			# Set kubernetes env variables
			KUBECONFIG = "${config.xdg.configHome}/kube/config";
			GPG_TTY = "$TTY";

			# Set less env variables
			LESSHISTFILE = "${config.xdg.stateHome}/.lesshistory";
			LESSHISTSIZE = 1000;

			# Set pass env variables
			PASSWORD_STORE_CLIP_TIME = 30;
			PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";

			# Set dotfiles path variables
			SHELLDIR = "${userSettings.dotfiles}/shell";
			UTILSDIR = "${userSettings.dotfiles}/utils";
			VIMDIR = "${userSettings.dotfilesDirectory}/vim";
			ZSHDIR = "${userSettings.dotfiles}/zsh";

			# Set workspace;
			WORKSPACE = "${workspaceDirectory}";

			# Set open-source workspace;
			OPEN_SOURCE = "${openSourceDirectory}";
			OPEN_SOURCE_PROJECTS = "${openSourceDirectory}/projects";
			OPEN_SOURCE_SCRIPTS = "${openSourceDirectory}/scripts";

			# Set private workspace;
			PRIVATE = "${privateDirectory}";
			PRIVATE_PROJECTS = "${privateDirectory}/projects";
			PRIVATE_SCRIPTS = "${privateDirectory}/scripts";

			# Set study workspace;
			STUDY = "${studyDirectory}";
			STUDY_PROJECTS = "${studyDirectory}/projects";
			STUDY_SCRIPTS = "${studyDirectory}/scripts";

			# Set work workspace;
			WORK = "${workDirectory}";
			WORK_PROJECTS = "${workDirectory}/projects";
			WORK_SCRIPTS = "${workDirectory}/scripts";
		};
	};

	xdg =
	{
		enable = true;
	};

	programs =
	{
		home-manager =
		{
			enable = true;
		};
	};
}
