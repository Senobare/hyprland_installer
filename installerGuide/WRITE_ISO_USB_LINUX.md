# Creating a Bootable Drive from an ISO on Linux

## Guide for Linux Users

Are you seriously looking for a guide to create a bootable USB on Linux? Come on, you're a Linux user, you were probably born knowing how to do this.
But just in case you've temporarily forgotten your innate skills, here's the "guide":

1. **Open your terminal.**  
You're already in it, aren't you?

2. **Find your USB device.**  
Use the magical powers of `lsblk` or `fdisk`. If you're feeling spicy, go for `dmesg`.

```
lsblk
```

3. **Unmount the USB drive.**
Because you're a responsible wizard who knows better than to write to a mounted device.

```
sudo umount /dev/sdX
```

4. **Write the ISO.**
You already know this command by heart, but here it is anyway—just in case you got distracted watching neofetch flex your specs.
```
sudo dd if=/path/to/file.iso of=/dev/sdX bs=4M status=progress
```

5. **Eject the drive.**
Because you're polite like that.

```
sudo eject /dev/sdX
```

6. **Done.**
Enjoy your bootable USB and the smug satisfaction of being a Linux user who doesn't really need a guide.

---------------------------------------------------------------------------------------------------------------------------------

**Bonus: Tech Heresy – Use a GUI Tool**
Now, if you want to commit tech heresy, you can go ahead and install a GUI tool like Etcher. But you know deep down it's a betrayal of your true Linux spirit.

*Hearken ye, who dares defy the ancient ways of the terminal. Prepare thine self, for the ritual to summon the demon Etcher is fraught with peril. Gather round, as this chant calls forth a creature of GUI, a fiendish tool that defiles the sacred command line.*

```
yay -S balena-etcher
```
```
sudo dnf install balena-etcher-electron
```
```
sudo apt install balena-etcher-electron
```
```
sudo zypper install balena-etcher
```
```
sudo apk add balena-etcher
```
