# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #Use Ubuntu 14.04 LTS
  config.vm.box = "ubuntu/trusty64"
  
  #Provision this box using a shell script. Fetches the latest version of NGINX, HHVM, MariaDB, and Anchor CMS
  config.vm.provision "shell", path: "bootstrap.sh"

  # Forward NGINX to port 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Optimize virtualbox's resources
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
