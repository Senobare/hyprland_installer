# Creating a Bootable Drive from an ISO on Windows

This guide explains how to create a bootable USB drive from an ISO file on Windows using a free tool called `Rufus`.

## Prerequisites
- A USB drive with sufficient storage capacity.
- The `.iso` file you want to use.
- [Rufus](https://rufus.ie/) (a free utility for creating bootable USB drives).

## Steps

1. **Download and install Rufus**  
   - Visit the [Rufus website](https://rufus.ie/) and download the latest version.
   - Install or run the portable version of Rufus.

2. **Insert the USB drive**  
   - Connect your USB drive to the computer.
   - Ensure you back up any important data, as the drive will be formatted.

3. **Open Rufus**  
   - Launch Rufus. It should automatically detect your USB drive.

4. **Select the ISO file**  
   - Under the **Boot selection** dropdown, choose **Disk or ISO image**.
   - Click **SELECT** and navigate to your `.iso` file.

5. **Configure Rufus settings**  
   - **Partition scheme**: Choose `MBR` for older systems or `GPT` for UEFI-based systems.
   - **File system**: Use `FAT32` for compatibility or `NTFS` for larger files.

6. **Start the process**  
   - Click **START** to begin writing the ISO file to the USB drive.
   - Confirm any warnings about formatting the drive.

7. **Wait for completion**  
   - Rufus will display a progress bar. Once finished, your USB drive will be ready to use.

8. **Eject the USB drive**  
   - Safely eject the drive by right-clicking the USB drive in File Explorer and selecting **Eject**.

Your USB drive is now bootable and ready to use.

[Back to Arch Linux Installation Guide](ARCHINSTALL_GUIDE.md)
