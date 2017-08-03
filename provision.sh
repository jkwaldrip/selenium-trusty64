#!/usr/bin/env sh

echo "Updating Ubuntu"
sudo apt-get update && sudo apt-get -f dist-upgrade

echo "Installing Chrome"
sudo apt-get -y install zip unzip
sudo apt-get -y install google-chrome-stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -y install -f

echo "Installing XVFB"
sudo apt-get -y install xvfb
sudo apt-get -y install -f

echo "Installing Java 8 OpenJDK"
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt-get update
sudo apt-get -y install openjdk-8-jdk
sudo update-alternatives --config java
java -version

echo "Downloading Selenium"
cd /tmp
wget "https://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar"

echo "Downloading Chromedriver"
wget "https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip

echo "Starting Xvfb"
export DISPLAY=:10
cd ~
Xvfb :10 -screen 0 1366x768x24 -ac &

echo "Starting Chrome"
google-chrome --remote-debugging-port=9222 &

echo "Starting Selenium"
java -Dwebdriver.chrome.driver=chromedriver -jar selenium-server-standalone-3.4.0.jar -role node -hub http://192.168.33.1:4444/grid/register/ &
