# SPDX-FileCopyrightText: © 2024 David Bliss
#
# SPDX-License-Identifier: GPL-3.0-or-later

[private]
default:
    just --list --justfile {{ justfile() }}

# Locally test flatpak build for flathub
build:
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak run org.flatpak.Builder \
        --force-clean \
        --sandbox \
        --user \
        --install \
        --install-deps-from=flathub \
        --ccache \
        --mirror-screenshots-url=https://dl.flathub.org/media/ \
        --repo=repo \
        builddir \
        app.fotema.Fotema.json

run:
    flatpak run --branch=master app.fotema.Fotema

clean:
    rm -rf .flatpak-builder builddir repo
