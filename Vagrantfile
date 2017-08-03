# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.provision :shell, path: "provision.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end
end
