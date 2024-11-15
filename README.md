# hyprland_installer
Welcome to **hyprland_installer**! This repository contains an **installer script** designed to set up a personalized and optimized **Hyprland** environment on your Arch Linux system. Whether you're a developer, enthusiast, or new to Hyprland, this script will guide you through the setup process and automate most of the configuration.

>**Note:** This installer does not cover NVIDIA or Intel cards. Currently, users with an NVIDIA or Intel card will need to troubleshoot on their own. For users with NVIDIA graphics, refer to the official guide here: [Hyprland NVIDIA Setup](https://wiki.hyprland.org/Nvidia/).
---

## 🌟 Requirements
Before diving into the installation, make sure your system meets the following requirements:
✅ System Prerequisites

### Minimal Arch Linux Installation:
  - A clean, up-to-date minimal installation of Arch Linux is required as the base system for setting up Hyprland. If you're new to Arch, check the [Arch Wiki](https://wiki.archlinux.org/title/Main_page) for guidance on installation.
  - System Architecture: Ensure your system is 64-bit with a modern CPU supporting Wayland.
  - Internet Connection:
  - A stable internet connection is essential for downloading packages and updates.
  - Basic Knowledge: Familiarity with terminal commands and Arch's package management (Pacman) will help during the setup.

### Tutorial on how to install Arch Linux
[Arch installation](installerGuide/ARCHINSTALL_GUIDE.md)

## 🚀 Installation
To get started, follow these simple steps to clone and run the installer script.

**1. Clone the Repository**
First, clone the repository to your local machine:
```
git clone https://github.com/Senobare/hyprland_installer.git
```
```
cd hyprland_installer/installerScript
```
**2. Run the Installer Script**
Next, run the installer.sh script to automatically set up your Hyprland environment:
```
sh installer.sh
```
This script will:
- Update your system packages.
- Install essential packages like Hyprland, Fish, Kitty, Nvim, and others.
- Set up Bluetooth, Hyprland window manager, and other necessary tools.
- Configure your default shell to Fish.
- Install key utilities and set up default themes.

## ⚠️ Reboot Required
Important: After running the installer, reboot your system to ensure all features, including CoreCtrl for AMD GPU management, are properly unlocked.

## ⌨️ Keybindings
Hyprland comes pre-configured with some essential keybindings that enhance your workflow. Here are the most important ones:
Superkey -> cmd / command or Windows key on most keyboards

- Super + T: Open the terminal (Kitty).
- Super + F: Open Firefox.
- Super + Q: Close the currently focused window.
- Super + Space: Open Wofi (App Picker).
- Super + E: Open Thunar (File Manager).
- Super + W: Cycles through your wallpapers

Customizing Keybindings

You can edit the keybindings and customize window behavior by modifying the ~/.config/hypr/hyprland.conf file.
This file also controls how programs are tied to Hyprland startup, so feel free to add or modify your favorite applications!

## 🎨 Customizing the Environment
Make your environment truly yours by adjusting the appearance and configuring the cursor. These tweaks will help you get started with a better-looking setup.
Follow this steps as a starting point for your system theme. 

**1. Set Dark theme:**
Set the Adwaita-Dark GTK theme using NWG-Look (will appear as GWK Setting in Wofi):

  - Run nwg-look and choose the Adwaita-Dark theme under GTK settings.

**2. Set the Cursor to BreezeX-RoséPine**
  - In NWG-Look Go to Cursor settings.
  - Choose BreezeX-RoséPine and set the size to 28.

Note: Most visual theme changes, such as the GTK theme and cursor, will be applied after a reboot.

**3. Set your wallpapers**
  - Download and add your wallpapers to the folder named WallDaemon located in the Pictures directory.

## 🔧 Additional Information
  - Packages: The script installs all core packages needed for Hyprland
  - CoreCtrl: During installation you will be aked if you are using an AMD GPU, the installer will install and configure CoreCtrl for managing GPU settings.
  - Bluetooth: The installer will enable Bluetooth services, install Blueman, and set up the necessary Bluetooth components.

## ⚙️ Troubleshooting
If you encounter any issues during installation, here are some common fixes:

  - Package Not Found: If any package fails to install, check the AUR or make sure your pacman mirrors are updated.
  - Keybinding Conflicts: If keybindings don’t work as expected, ensure there are no conflicts in the ~/.config/hypr/hyprland.conf file.
  - CoreCtrl Issues: After installation, ensure you reboot the system to fully enable CoreCtrl functionalities.

## 💬 Contact & Support
If you have any issues, feel free to open an issue on this GitHub repository.

![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)

