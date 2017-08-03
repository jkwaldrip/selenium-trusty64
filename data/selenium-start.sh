#!/usr/bin/env sh

echo "Starting Xvfb"
export DISPLAY=:10
cd ~
Xvfb :10 -screen 0 1366x768x24 -ac &

echo "Starting Chrome"
google-chrome --remote-debugging-port=9222 &

echo "Starting Selenium"
java -Dwebdriver.chrome.driver=chromedriver -jar selenium-server-standalone-3.4.0.jar -role node -hub http://192.168.33.1:4444/grid/register/ &
