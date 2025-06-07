# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands
- Update NixOS: `sudo nixos-rebuild switch --flake ~/dotfiles#spica`
- Update Home Manager: `home-manager switch --flake ~/dotfiles#hitsan`
- Update flake: `nix flake update`
- Lint: `nixpkgs-fmt *.nix`
- Check configuration: `nix flake check`

## Code Style Guidelines
- **Formatting**: Use 2-space indentation for Nix files
- **Imports**: Group imports logically by category (system, home-manager, etc.)
- **Naming**: Use camelCase for variables, snake_case for paths
- **File Organization**: 
  - Place system configurations in `/hosts/{hostname}`
  - Place user configurations in `/home-manager/{category}`
  - Place shared modules in `/modules`
- **Error Handling**: Use `lib.mkIf` for conditional configurations
- **Documentation**: Add comments for non-obvious configurations