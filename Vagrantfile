# -*- mode: ruby -*-
# vi: set ft=ruby :

REQUIRED_PLUGINS        = %w(vagrant-vbguest vagrant-librarian-chef-nochef)

plugins_to_install = REQUIRED_PLUGINS.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
    puts "Installing required plugins: #{plugins_to_install.join(' ')}"
    if system "vagrant plugin install #{plugins_to_install.join(' ')}"
        exec "vagrant #{ARGV.join(' ')}"
    else
        abort "Installation of one or more plugins has failed. Aborting. Please read the Bike Index README."
    end
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    config.vm.box = "bento/centos-7.6"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

    config.ssh.forward_agent = true

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false

        # Customize the amount of memory on the VM:
        vb.memory = "1024"
    end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
    # such as FTP and Heroku are also available. See the documentation at
    # https://docs.vagrantup.com/v2/push/atlas.html for more information.
    # config.push.define "atlas" do |push|
    #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
    # end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.
    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL

    #  config.vm.provision :puppet,
    #      :manifests_path => 'puppet/manifests',
    #      :module_path => 'puppet/modules'
    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        chef.add_recipe "yum"
        chef.add_recipe "yum-epel"
        chef.add_recipe "system::install_packages"
        chef.add_recipe "ruby_build"
        chef.add_recipe "ruby_rbenv::system"
        chef.add_recipe "ruby_rbenv::system_install"
        chef.add_recipe "ruby_rbenv::user"
        chef.add_recipe "ruby_rbenv::user_install"
        chef.add_recipe "vim"

        chef.json = {
            system: {
                packages: {
                    install: ["redis", "nodejs", "libpqxx-devel", "rubygems", "mariadb-devel", "sqlite-devel", "sqlite", "vim-enhanced"]
                }
            },
            rbenv: {
                user_installs: [{
                    user: 'vagrant',
                    rubies: ["2.3.8"],
                    global: "2.3.8"
                }]
            }
        }
    end

    config.vm.provision "shell",
      inline: "sudo -u vagrant /home/vagrant/.rbenv/bin/rbenv install 2.3.8 && /home/vagrant/.rbenv/shims/gem install bundler -v 1.17.3 && systemctl disable firewalld && systemctl stop firewalld"
end
