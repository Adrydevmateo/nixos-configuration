# Rebuild with Flakes

```sh
sudo nixos-rebuild switch --flake .#nixos  
```

# Update system

```sh
nix flake update
```

`Then rebuild.`

# Verify Flakes configuration

```sh
nix flake metadata
```

# List NixOS generations

```sh
sudo nixos-rebuild list-generations
```

# Rollback NixOS configuration

```sh
sudo nixos-rebuild switch --rollback
```
