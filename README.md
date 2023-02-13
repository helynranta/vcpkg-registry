# Updating port

```sh
git rev-parse HEAD:ports/reload-engine
```

# test install

```sh
vcpkg install --overlay-ports=ports --x-install-root=install reload-engine
```