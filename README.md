<a href="https://dotfyle.com/ahkohd/nvim"><img src="https://dotfyle.com/ahkohd/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/ahkohd/nvim"><img src="https://dotfyle.com/ahkohd/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/ahkohd/nvim"><img src="https://dotfyle.com/ahkohd/nvim/badges/plugin-manager?style=flat" /></a>

# nvim

Victor's neovim config.

## Installation

To use this configuration:

1. Clone this repository:

```
git clone https://github.com/ahkohd/nvim.git ~/.config/nvim
```

2. Launch Neovim, and the plugins will be automatically installed (assuming you have a plugin manager, `lazy.nvim`).

## Usage

Once installed, you can start using Neovim with this configuration immediately. Refer to the `init.vim` file for configuration settings and mappings.

### Automated Installation

To quickly set up Neovim with this configuration, you can use the following script:

```bash
curl -fsSL https://raw.githubusercontent.com/ahkohd/nvim/main/scripts/nvim-config | sh
```

This script will download and apply the Neovim configuration automatically.

### Nix Derivative

If you're using a Nix derivative, you can add the following derivation to your Nix configuration:

```nix
{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "nvim-config";
  version = "0.0.0";
  src = builtins.fetchGit {
    url = "https://github.com/ahkohd/nvim.git";
    rev = "pick a commit hash";
    # for example:
    # ref = "895701f62118fc7078d323ace49934428d50e0a8"
  };

  installPhase = ''
    mkdir -p $out/bin

    cp -r $src/scripts/nvim-config $out/bin/nvim-config

    chmod +x $out/bin/nvim-config
  '';
}
```

This derivation fetches the Neovim configuration from this repository and installs it into your system.

To add it to your system packages, modify your configuration.nix as follows:

```nix
environment.systemPackages = with pkgs; [
  nvim-config
];
```

After adding the package, rebuild your NixOS system using:

```bash
sudo nixos-rebuild switch
```

Then, you can run:

```bash
nvim-config --help
```
