# Rebuild with Flakes

```sh
sudo nixos-rebuild switch --flake .#nixos  
```
`add flag "--show-trace" at the end for checking errors`

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

## Noctalia

User lingering must be anabled: `loginctl enable-linger <username>`

After that make sure noctalia is running: `systemctl --user status noctalia-shell.service`
