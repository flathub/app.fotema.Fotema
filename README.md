<!--
SPDX-FileCopyrightText: © 2024-2026 David Bliss

SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Fotema for Flathub

## Setup

To test locally install [just](https://github.com/casey/just) and Flatpak Builder.

> [!NOTE]
> The new Flathub build infrastructure also uses `just` which caused a clash
> with the `Justfile` in this repo. The `Justfile` here now has the name
> `flatpak.justfile` to avoid that clash.

## Prepare a new release

1. Update the tag and hash in [manifest](app.fotema.Fotema.json).
  1. Check the `runtime` is up-to-date.
  2. Check that `llvm` is up-to-date.
  3. Check for other changes between the Flathub manifest and the dev manifest.
2. Run [release.sh](release.sh) to update [cargo-sources.json](cargo-sources.json).
3. Copy updated `modules` files from [blissd/fotema/build-aux/modules](https://github.com/blissd/fotema/tree/main/build-aux/modules).

### Test locally

Build and run using `just`:

```bash
export JUST_JUSTFILE=flatpak.justfile
just build
just run
```

### Release to Flathub

1. Commit to a new branch and push.
2. Create PR.
3. If PR build successful, then merging will publish new release.
