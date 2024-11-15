# Arch Linux Installation Guide
If you don't have Arch Linux set up yet, here is a step-by-step guide to install it.

## 1. Download the Arch Linux ISO
Go to the [Arch Linux download page](https://www.archlinux.org/download/) and download the .iso

## 2. Create a Bootable USB
- [Linux](isntallerGuide/WRITE_ISO_USB_LINUX.md)

- [MacOS](instellerGuide/WRITE_ISO_USB_MAC.md)

- [Windows](instellerGuide/WRITE_ISO_USB_WINDOWS.md)

## 3. Install Arch Linux
Boot from the live USB you created. You can follow the [official installation guide](https://wiki.archlinux.org/title/Installation_guide) to install Arch Linux. For e simpler Arch Linux installation you can use the command:
```
archinstall
```
[official archinstall guide](https://archinstall.archlinux.page/installing/guided.html#)
Don't worry about all the plain text in the guides. Once archinstall starts, the process is quite intuitive. These guides are here to help you understand the options and steps available during the installation.

## 4. Post-installation Setup
After installing Arch, reboot your system and follow the steps below to set up your environment for the script:
   
- Install required packages:
  ```
  sudo pacman -S git
  ```

## 5. Finishing up
You now have a minimal Arch Linux installation. You can now proceed however you want or use my installer script to set up a minimal Hyprland isntallation. 
