#!/bin/bash

# Define colors for echo messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 0: Update and Upgrade
echo -e "${GREEN}Step 0:${NC} Updating and Upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Step 1: Install zsh
echo -e "${GREEN}Step 1:${NC} Installing zsh..."
sudo apt install -y zsh

# Step 2: Set DNS servers
echo -e "${GREEN}Step 2:${NC} Setting DNS servers..."
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Step 3: Navigate to the home directory
echo -e "${GREEN}Step 3:${NC} Navigating to the home directory..."
cd ~

# Step 4: Download Node.js tarball
echo -e "${GREEN}Step 4:${NC} Downloading Node.js tarball..."
sudo wget https://nodejs.org/dist/v20.5.1/node-v20.5.1-linux-armv7l.tar.xz

# Step 5: Extract Node.js
echo -e "${GREEN}Step 5:${NC} Extracting Node.js..."
sudo tar -xvf node-v20.5.1-linux-armv7l.tar.xz

# Step 6: Enter Node.js directory
echo -e "${GREEN}Step 6:${NC} Entering Node.js directory..."
cd node-v20.5.1-linux-armv7l

# Step 7: Copy files to /usr/local
echo -e "${GREEN}Step 7:${NC} Copying files to /usr/local..."
sudo cp -R * /usr/local

# Step 8: Clean up Node.js files
echo -e "${GREEN}Step 8:${NC} Cleaning up Node.js files..."
cd ~
sudo rm -rf node-v20.5.1-linux-armv7l.tar.xz node-v20.5.1-linux-armv7l

# Step 9: Install Oh My Zsh
echo -e "${GREEN}Step 9:${NC} Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Done
echo -e "${YELLOW}Node.js installation, Oh My Zsh installation, and DNS configuration completed successfully!${NC}"
