#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y btop fastfetch niri foot greetd khal adwaita-fonts-all igt-gpu-tools nautilus firefox lm_sensors cups-pk-helper fprintd kf6-kimageformats

# Enable the DMS COPR, install packages, then disable it so it doesn't
# end up enabled on the final image (packages will be pinned to build-time versions).
dnf5 -y copr enable avengemedia/dms
dnf5 -y install dms dsearch dms-greeter qt6ct-kde dankcalendar-git tuned-ppd
dnf5 -y copr disable avengemedia/dms

# Brave browser repo
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y install brave-origin

systemctl enable podman.socket
systemctl enable greetd.service
systemctl enable flatpak-system-install.service

### Cleanup build artifacts so they don't ship in the image
dnf5 clean all
rm -rf \
  /run/dnf \
  /run/selinux-policy \
  /run/tuned \
  /var/lib/dnf \
  /var/lib/fprint \
  /var/lib/greetd \
  /var/lib/tuned
