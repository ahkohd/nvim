return {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { 'flake.nix', '.git', '.jj' },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/var/.dotfiles").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/var/.dotfiles").homeConfigurations.nixos.options',
				},
			},
		},
	},
}

