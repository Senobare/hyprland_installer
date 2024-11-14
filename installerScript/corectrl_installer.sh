#!/bin/bash

echo "corectrl configuration starting..."

# Function to create the polkit rule file
create_polkit_rule() {
    echo "Creating /etc/polkit-1/rules.d/90-corectrl.rules with sudo rights..."
    
    # Content to be added to the file
    local POLKIT_CONTENT='polkit.addRule(function(action, subject) {
    if ((action.id == "org.corectrl.helper.init" ||
         action.id == "org.corectrl.helperkiller.init") &&
        subject.local == true &&
        subject.active == true &&
        subject.isInGroup(wheel)) {
            return polkit.Result.YES;
    }
});'

    # Write the content to the file with sudo
    echo "$POLKIT_CONTENT" | sudo tee /etc/polkit-1/rules.d/90-corectrl.rules > /dev/null
    echo "Polkit rule file created successfully."
}

# Function to update GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub
update_grub_config() {
    echo "Updating /etc/default/grub to include amdgpu.ppfeaturemask=0xffffffff"
    
    # File to modify
    local GRUB_FILE="/etc/default/grub"
    
    # Check if amdgpu.ppfeaturemask is already in the GRUB_CMDLINE_LINUX_DEFAULT line
    if grep -q 'amdgpu.ppfeaturemask=0xffffffff' "$GRUB_FILE"; then
        echo "amdgpu.ppfeaturemask=0xffffffff already exists in GRUB_CMDLINE_LINUX_DEFAULT."
    else
        # Add amdgpu.ppfeaturemask=0xffffffff to GRUB_CMDLINE_LINUX_DEFAULT without deleting existing options
        sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/s/"$/ amdgpu.ppfeaturemask=0xffffffff"/' "$GRUB_FILE"
        echo "GRUB_CMDLINE_LINUX_DEFAULT updated successfully."
    fi
}

# Call the functions
create_polkit_rule
update_grub_config

# Regenerate GRUB configuration to apply the changes
echo "Regenerating GRUB configuration..."
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB configuration regenerated successfully."

echo "corectrl configuration finished!"

