# Fish path config

if set -q FISH_PATH_CONFIG_IS_SOURCED
else
#	. ~/.nix-profile/etc/profile.d/nix.fish
	#eval (~/.cargo/bin/rtx activate fish)
	set -gx PATH $HOME/.cargo/bin $PATH
	set -gx PATH ~/.local/share/bob/nvim-bin $PATH
	set -gx FISH_PATH_CONFIG_IS_SOURCED true
end
