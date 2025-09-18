<!--
SPDX-FileCopyrightText: © 2024 David Bliss

SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Fotema for Flathub

To test locally install [just](https://github.com/casey/just) and Flatpak Builder.

> [!NOTE]
> The new Flathub build infrastructure also uses `just` which caused a clash
> with the `Justfile` in this repo. The `Justfile` here now has the name
> `flatpak.justfile` to avoid that clash.


Run:

```shell
export JUST_JUSTFILE=flatpak.justfile
just build
just run
```

