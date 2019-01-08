# -*- mode: ruby -*-
# vi: set ft=ruby :
scriptDir = File.dirname(__FILE__)
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "wordpress"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
   config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.50.10"

 #Folders sync
  # Default Port Forwarding
  #      default_ports = {
   #         80 => 8000,
   #         443 => 44300,
   #         3306 => 33060,
   #         4040 => 4040,
   #         5432 => 54320,
   #         8025 => 8025,
   #         27017 => 27017
   #     }
#
   # default_ports.each do |guest, host|
    #        unless settings["ports"].any? { |mapping| mapping["guest"] == guest }
    #            config.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
    #        end
    #    end
      

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
   config.vm.synced_folder "www/", "/vagrant/www"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  ##Instalando y configurando apache
  config.vm.provision "shell" do |s|
    s.name = " Instalando Apache"
    s.path = scriptDir+"/scripts/install_apache.sh"
  end

##Instalando y configurando Mariadb
  config.vm.provision "shell" do |s|
    s.name = "Instalando Maria DB"
    s.path = scriptDir+"/scripts/install_maria.sh"
  end

  ##Instalando y configurando apache
  config.vm.provision "shell" do |s|
    s.name = " Instalando PHP Modules"
    s.path = scriptDir+"/scripts/install_modules-php.sh"
  end

  ##Instalando y configurando Mariadb
  config.vm.provision "shell" do |s|
    s.name = "Creando base de datos Mysql"
    s.path = scriptDir+"/scripts/create_mysql.sh"
  end


  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
