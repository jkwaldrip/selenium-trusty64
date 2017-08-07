#!/usr/bin/env sh

echo "Updating Ubuntu"
sudo apt-get update && sudo apt-get -f dist-upgrade

echo "Installing Chrome"
sudo apt-get -y install zip unzip
sudo apt-get -y install google-chrome-stable
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -y install -f

echo "Installing Firefox"
sudo apt-get -y install firefox

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
wget "https://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar"

echo "Downloading Chromedriver"
wget "https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip

echo "Downloading Geckodriver"
wget "https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz"
tar -xzvf geckodriver*
chmod +x geckodriver

echo "All done!"
