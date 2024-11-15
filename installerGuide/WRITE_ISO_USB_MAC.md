# Creating a Bootable Drive from an ISO on macOS

This guide explains how to use the `dd` command to write an ISO file to a USB or external drive on macOS.

## Prerequisites
- A USB drive or external disk to write the ISO to.
- The `.iso` file you want to use.
- Administrator privileges to run commands with `sudo`.

## Steps

1. **Identify the target disk**  
Insert the USB drive or external disk, then list all connected drives to find its identifier:

```
diskutil list
```

Look for your USB drive in the output, e.g., `/dev/disk2`.

2. **Unmount the disk**  
Unmount the disk without ejecting it to prepare for writing:

```
diskutil unmountDisk /dev/diskX
```

Replace `diskX` with your disk's identifier (e.g., `/dev/disk2`).

3. **Write the ISO file to the disk**  
Use the `dd` command to write the ISO to the disk. Replace `/path/to/file.iso` with the path to your ISO file, and replace `diskX` with your disk's identifier:

```
sudo dd if=/path/to/file.iso of=/dev/diskX bs=1m
```

Explanation:
- `if=`: Specifies the input file (your `.iso`).
- `of=`: Specifies the output file (the target disk).
- `bs=1m`: Sets the block size to 1 megabyte for better performance.

4. **Monitor progress (optional)**
If you'd like to see progress during the write process, use the following command instead:

```
sudo dd if=/path/to/file.iso of=/dev/diskX bs=1m status=progress
```

5. **Eject the disk**  
Once the process completes, eject the disk safely:

```
diskutil eject /dev/diskX
```

Your USB drive or external disk is now ready to use as a bootable drive.

