[![bluebuild build badge](https://github.com/wegweg7979/hurunagus-ublue/actions/workflows/build.yml/badge.svg)](https://github.com/wegweg7979/hurunagus-ublue/actions/workflows/build.yml)

<img width="402" height="426" alt="542900251-a3d3f06c-29eb-40a7-a096-213a3418af8e" src="https://github.com/user-attachments/assets/9fd35c36-06b1-4b77-8160-c663de0a53a9" />







Declarative, Atomic, immutable linux system. Fedora base, from ublue, with customisations including WM Niri with Dank Material Shell, and all the apps i need.

Reason to exist: making all my computers run identical systems, with silent auto updates and admin in one place, this repo. 
Automatic builds once a week on a tuesday. 
Dont use this- make your own with bluebuild, it is not too difficult and quite fun.

To install from scratch- installer iso can be found in the release section.
To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/wegweg7979/hurunagus-ublue:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/wegweg7979/hurunagus-ublue:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
- To generate an installer .iso : 
  ```
  sudo bluebuild generate-iso -V server --iso-name hurunagus.iso image ghcr.io/wegweg7979/hurunagus-ublue
  ```



Niri + Dank Material Shell
<img width="1918" height="1077" alt="Screenshot from 2026-07-09 21-42-39" src="https://github.com/user-attachments/assets/6eb851fc-b459-4695-99fb-0d3323b71f09" />




