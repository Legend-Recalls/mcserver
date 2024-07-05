#!/bin/bash

# 1) Update Java to version 21 and set it as default
echo "> Updating Java to version 21..."
sudo apt update && sudo apt install -y openjdk-21-jdk && sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-21-openjdk-amd64/bin/java 21 && sudo update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java

# 2) Install mcman
echo "> Installing mcman..."
wget https://github.com/ParadigmMC/mcman/releases/latest/download/mcman && sudo mv ./mcman /usr/bin/ && sudo chmod +x /usr/bin/mcman

# 3) Install Playit.gg
echo "> Installing Playit.gg..."
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | sudo apt-key add - && sudo curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list && sudo apt update && sudo apt install -y playit && echo "> Playit.gg Installation Completed!"

# 4) Run mcman in a new screen
echo "> Starting mcman in a new screen..."
screen -dmS mcman /usr/bin/mcman

# 5) Run Playit.gg in a new screen
echo "> Starting Playit.gg in a new screen..."
screen -dmS playit playit

# Instructions
echo "-- Setup Completed! --"
echo
echo "Type [screen -ls] to check the Running Processes"
echo "Type [screen -r mcman] to enter the mcman Console"
echo "Type [screen -r playit] to enter the Playit Console"
echo ""
echo "> To stop your mcman or Playit session, type 'screen -r [session name]' and then 'exit'"
