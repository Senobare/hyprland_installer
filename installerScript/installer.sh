INSTALLER_DIR=~/My_Hyprland/installerScript
INSTALLER_SCRIPT=$INSTALLER_DIR/installer.sh
CONFIG_DIR=~/.config

# Ensure ~/.config exists
echo -e "\033[1;34mChecking if $CONFIG_DIR exists...\033[0m"
if [ ! -d "$CONFIG_DIR" ]; then
    echo -e "\033[1;34m$CONFIG_DIR does not exist. Creating it...\033[0m"
    sudo mkdir -p "$CONFIG_DIR"
else
    echo -e "\033[1;34m$CONFIG_DIR already exists.\033[0m"
fi

# Copy everything from MY_hyprland to ~/.config, overwrite duplicates
echo -e "\033[1;34mCopy files from ~/MY_hyprland to $CONFIG_DIR...\033[0m"
sudo cp -f ~/My_Hyprland/* "$CONFIG_DIR/" 2>/dev/null

# Ensure the script itself remains executable and in place during execution
if [ ! -f "$INSTALLER_SCRIPT" ]; then
    echo -e "\033[1;34mInstaller script is missing from $INSTALLER_SCRIPT!\033[0m"
    exit 1
fi

# Proceed with the installation tasks
echo -e "\033[1;34mStarting the installation process...\033[0m"

# Function to check if a package is installed (pacman)
is_installed_pacman() {
    pacman -Qi "$1" &>/dev/null
}

# Function to check if a package is installed (yay)
is_installed_yay() {
    yay -Q "$1" &>/dev/null
}

# Update system and install pacman packages
echo -e "\033[1;34mUpdating system and installing packages via pacman...\033[0m"
sudo pacman -Syu --noconfirm

declare -a PACMAN_PACKAGES=("git" "thunar" "fish" "hyprland" "kitty" "nvim" "swaync" "swww" "waybar" "pipewire" "wireplumber" "qt5-wayland" "nwg-look" "gnome-themes-extra" 
"ttf-jetbrains-mono-nerd" "qt6-wayland" "bluez" "bluezutils" "blueman" "pavucontrol" "wofi" "cliphist" "wl-clipboard" "less" "xdg-desktop-portal-hyprland" "firefox")

for pkg in "${PACMAN_PACKAGES[@]}"; do
    if is_installed_pacman "$pkg"; then
        echo -e "\033[1;34mPackage $pkg is already installed.\033[0m"
    else
        echo -e "\033[1;34mInstalling $pkg...\033[0m"
        sudo pacman -S --needed --noconfirm "$pkg"
    fi
done

# Ask if an AMD GPU is in use after the pacman installations
echo -e "\033[1;34mDo you have an AMD GPU in use? (y/n)\033[0m"
read -r AMD_GPU_IN_USE

if [[ "$AMD_GPU_IN_USE" == "y" || "$AMD_GPU_IN_USE" == "Y" ]]; then
    # Install Vulkan packages for AMD GPU
    echo -e "\033[1;34mInstalling Vulkan packages for AMD GPU...\033[0m"
    sudo pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon

    # Install Steam
    echo -e "\033[1;34mInstalling Steam...\033[0m"
    sudo pacman -S --needed --noconfirm steam

    # Install corectrl for AMD GPU management
    echo -e "\033[1;34mInstalling corectrl for AMD GPU management...\033[0m"
    sudo pacman -S --needed --noconfirm corectrl
else
    echo -e "\033[1;34mSkipping AMD GPU setup, as no AMD GPU was declared.\033[0m"
fi

# Install yay if not already installed
if ! command -v yay &>/dev/null; then
    echo -e "\033[1;34mInstalling yay...\033[0m"
    if ! is_installed_pacman "base-devel"; then
        sudo pacman -S --needed --noconfirm base-devel
    fi
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay || exit
    makepkg -si --noconfirm
    cd ~
    sudo rm -rf ~/yay
else
    echo -e "\033[1;34myay is already installed.\033[0m"
fi

# Final yay update and development package update immediately after yay installation
echo -e "\033[1;34mUpdating all packages with yay...\033[0m"
yay -Syu --devel --noconfirm

# Configure yay for development packages
echo -e "\033[1;34mConfiguring yay for development package management...\033[0m"
yay -Y --gendb --noconfirm
yay -Y --devel --save --noconfirm

# Install hyprpolkitagent-git
AUR_PACKAGE="hyprpolkitagent-git"
if is_installed_yay "$AUR_PACKAGE"; then
    echo -e "\033[1;34mPackage $AUR_PACKAGE is already installed.\033[0m"
else
    echo -e "\033[1;34mInstalling $AUR_PACKAGE with yay...\033[0m"
    yay -S --noconfirm "$AUR_PACKAGE"
fi

# Ensure yay removes conflicting package during hyprpolkitagent-git installation
echo -e "\033[1;34mVerifying hyprpolkitagent-git installation and ensuring conflicts are resolved...\033[0m"
yay -S "$AUR_PACKAGE" --noconfirm --needed --answerclean y

# Install rose-pine-cursor
echo -e "\033[1;34mInstalling rose-pine-cursor...\033[0m"
yay -S --noconfirm rose-pine-cursor

# Install discord
echo -e "\033[1;34mInstalling discord_arch_electron...\033[0m"
yay -S --noconfirm discord_arch_electron

# Create ~/Pictures/WallDaemon if it doesn't exist
echo -e "\033[1;34mCreating ~/Pictures/WallDaemon directory if it doesn't exist...\033[0m"
if [ ! -d "$HOME/Pictures" ]; then
    sudo mkdir -p "$HOME/Pictures"
fi

if [ ! -d "$HOME/Pictures/WallDaemon" ]; then
    sudo mkdir -p "$HOME/Pictures/WallDaemon"
fi

# Set Fish as the default shell
echo -e "\033[1;34mSetting Fish as the default shell...\033[0m"
if ! grep -q "/usr/bin/fish" /etc/shells; then
    echo "/usr/bin/fish" | sudo tee -a /etc/shells
fi
chsh -s /usr/bin/fish

# Set Nvim as the default editor
echo -e "\033[1;34mSetting Nvim as the default editor...\033[0m"
sudo update-alternatives --set editor /usr/bin/nvim

# Bluetooth setup: Ensure Bluetooth services are enabled and started
echo -e "\033[1;34mEnsuring Bluetooth services are enabled and started...\033[0m"
sudo systemctl enable bluetooth.service
sudo systemctl enable bluez.service
sudo systemctl enable blueman.service
sudo systemctl start bluetooth.service
sudo systemctl start bluez.service
sudo systemctl start blueman.service

# Check if corectrl was installed and grub is used
echo -e "\033[1;34mChecking if GRUB is installed...\033[0m"
if is_installed_pacman "grub"; then
    # Check if corectrl is installed and run the corectrl_installer if it is
    if is_installed_pacman "corectrl"; then
        echo -e "\033[1;34mcorectrl is installed, running the corectrl installer...\033[0m"
        bash "$INSTALLER_DIR/corectrl_installer.sh"
    else
        echo -e "\033[1;34mcorectrl is not installed, skipping corectrl installer.\033[0m"
    fi
else
    echo -e "\033[1;34mGRUB is not installed. Skipping corectrl installer.\033[0m"
fi

# Cleanup
echo -e "\033[1;34mCleaning up...\033[0m"
sudo rm -rf ~/My_Hyprland
sudo rm -rf "$CONFIG_DIR/installerScript"

# Ensure all files and folders in ~/.config are changeable by the user
echo -e "\033[1;34mEnsuring all files and folders in ~/.config are changeable by the user...\033[0m"
sudo chown -R $USER:$USER "$HOME/.config"

# Ensure ~/Pictures and ~/Pictures/WallDaemon are changeable by the user
echo -e "\033[1;34mEnsuring ~/Pictures and ~/Pictures/WallDaemon are changeable by the user...\033[0m"
sudo chown -R $USER:$USER "$HOME/Pictures"
sudo chown -R $USER:$USER "$HOME/Pictures/WallDaemon"

echo -e "\033[1;34mInstallation script completed successfully.\033[0m"

# Start Hyprland
echo -e "\033[1;34mStarting Hyprland...\033[0m"
Hyprland

