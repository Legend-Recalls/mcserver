#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1) Update Java to version 21 and set it as default
echo -e "${CYAN}> Updating Java to version 21...${NC}"
sudo apt update && sudo apt install -y openjdk-21-jdk && sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-21-openjdk-amd64/bin/java 21 && sudo update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java

# 2) Install screen if not installed
echo -e "${CYAN}> Checking if screen is installed...${NC}"
if ! command -v screen &> /dev/null; then
    echo -e "${YELLOW}> Installing screen...${NC}"
    sudo apt install -y screen
fi
echo -e "${GREEN}> screen is installed!${NC}"

# 3) Install mcman
echo -e "${CYAN}> Installing mcman...${NC}"
wget https://github.com/ParadigmMC/mcman/releases/latest/download/mcman && sudo mv ./mcman /usr/bin/ && sudo chmod +x /usr/bin/mcman

# 4) Install Playit.gg
echo -e "${CYAN}> Installing Playit.gg...${NC}"
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | sudo apt-key add - && sudo curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list && sudo apt update && sudo apt install -y playit && echo -e "${GREEN}> Playit.gg Installation Completed!${NC}"

# 5) Run mcman in a new screen
echo -e "${CYAN}> Starting mcman in a new screen...${NC}"
screen -dmS mcman /usr/bin/mcman

# 6) Run Playit.gg in a new screen
echo -e "${CYAN}> Starting Playit.gg in a new screen...${NC}"
screen -dmS playit playit

# Instructions
echo -e "${GREEN}-- Setup Completed! --${NC}"
echo
echo -e "${CYAN}Type [screen -ls] to check the Running Processes${NC}"
echo -e "${CYAN}Type [screen -r mcman] to enter the mcman Console${NC}"
echo -e "${CYAN}Type [screen -r playit] to enter the Playit Console${NC}"
echo ""
echo -e "${YELLOW}> To stop your mcman or Playit session, type 'screen -r [session name]' and then 'exit'${NC}"
