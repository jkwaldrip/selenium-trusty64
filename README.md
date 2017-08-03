# selenium-trusty64

A Vagrant box to get up and running with Selenium and Chromedriver on Trusty64

# Usage

Clone this repository with
    $ git@github.com:jkwaldrip/selenium-trusty64.git

Start a Selenium grid server locally
    $ java -jar selenium-server-standalone-3.4.0.jar -role hub -host 192.168.33.1

Bring up the vagrant box with
    $ vagrant up --provision

Your Selenium node will start automagically and register to your Selenium hub
