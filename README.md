<!--
SPDX-FileCopyrightText: © 2024 David Bliss

SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Modules

## libonnxruntime
Required by the rust-faces dependencies. The rust-faces cargo build
actually puts a libonnxruntime.so in the build tree... but I can't get
Meson to find the file and copy to the /app/lib directory of the Flatpak.

If that can be fixed, then this module can be removed.
