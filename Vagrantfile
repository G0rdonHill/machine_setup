Vagrant.configure("2") do |config|
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    # Customize the amount of memory on the VM:
    vb.memory = "4000"
  end
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.provision "shell", path: "./scripts/init_ubuntu.sh"
    ubuntu.vm.box = "ubuntu/bionic64"
  end
  config.vm.define "mint" do |mint|
    mint.vm.provision "shell", path: "./scripts/init_ubuntu.sh"
    mint.vm.box = "mrlesmithjr/linuxmint-19.3"
  end
end
