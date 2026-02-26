# NixOS Flake Configuration

This repository contains my fully declarative NixOS system configuration managed with **Nix flakes** and **Home Manager**.

The system is designed to be:

* Reproducible
* Version-controlled
* Declarative
* Flake-based
* Wayland-native (Niri session)
* GitHub integrated via `gh`

---

## System Overview

### Core

* NixOS (unstable channel via flakes)
* Flakes enabled
* Home Manager integrated as a NixOS module
* Git-managed `/etc/nixos`

### Display & Session

* `greetd` as login manager
* `niri` as Wayland compositor
* `noctalia-shell` enabled at session start
* `mako` notifications
* `fuzzel` launcher
* `swaybg`, `swayidle`
* `xwayland-satellite`

### Desktop Integration

* NetworkManager
* Bluetooth
* power-profiles-daemon
* upower
* gnome-keyring
* xdg-desktop-portal-gnome

### Applications

* Brave browser
* Alacritty terminal
* Kitty terminal
* Helix editor (custom config)
* Git + GitHub CLI (`gh`)
* httpie
* atool

---

## Repository Structure

```
/etc/nixos
├── flake.nix
├── flake.lock
├── configuration.nix
├── hardware-configuration.nix
├── home.nix
├── helix/
│   └── config.nix
└── README.md
```

---

## Rebuilding the System

From `/etc/nixos`:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

To update flake inputs:

```bash
nix flake update
sudo nixos-rebuild switch --flake .#nixos
```

---

## Home Manager

Home Manager is integrated as a NixOS module.

To apply user-level changes independently:

```bash
home-manager switch --flake /etc/nixos#nixos
```

---

## Git + GitHub CLI

Git is configured declaratively in `home.nix`.

`gh` is installed via Home Manager.

After first setup:

```bash
gh auth login
```

Credentials are stored in:

```
~/.config/gh/
```

No absolute credential helper paths are used.

---

## Persistence Notes

User application data (e.g., Brave profile) lives under:

```
~/.config/
```

Home Manager does not overwrite application data unless explicitly configured with `force = true`.

---

## State Version

```
system.stateVersion = "25.11";
home.stateVersion   = "25.11";
```

These are intentionally pinned and should not be changed without understanding migration implications.

---

## Workflow

Typical change workflow:

```bash
git add .
git commit -m "Describe change"
sudo nixos-rebuild switch --flake .#nixos
```

---

## Design Principles

* Everything declarative
* No manual system drift
* Flake-pinned inputs
* Git versioned infrastructure
* Reproducible rebuilds on fresh install

---

If needed, this repository can be cloned onto a fresh NixOS installation and rebuilt directly:

```bash
sudo nixos-rebuild switch --flake /path/to/repo#nixos
```

---
