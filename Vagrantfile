# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

    config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"
    config.vm.synced_folder "./", "/vagrant", type: "nfs"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    config.vm.provider "libvirt" do |vm|
        # Customize the amount of memory on the VM:
        vm.memory = "1024"
    end

    config.vm.provision "shell", inline: <<-SHELL
      yum install -y nfs-utils
    SHELL

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "rvm-playbook.yml"
    end

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "vagrant-playbook.yml"
    end

    config.vm.provision "shell", inline: <<-SHELL
      systemctl disable firewalld && systemctl stop firewalld
    SHELL
end

