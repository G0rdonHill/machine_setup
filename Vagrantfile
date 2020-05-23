Vagrant.configure("2") do |config|
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # config.vm.synced_folder "../data", "/vagrant_data"
  # https://bugs.launchpad.net/cloud-images/+bug/1874453
  NOW = Time.now.strftime("%d.%m.%Y.%H:%M:%S")
  FILENAME = "serial-debug-%s.log" % NOW
  config.vm.provider "virtualbox" do |vb|
     vb.customize [ "modifyvm", :id, "--uart1", "0x3F8", "4" ]
     vb.customize [ "modifyvm", :id, "--uartmode1", "file",
     File.join(Dir.pwd, FILENAME) ]
    # Customize the amount of memory on the VM:
     vb.memory = "4000"
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  end
  config.vm.define "ubuntu_bionic" do |ubuntu_bionic|
    ubuntu_bionic.vm.provision "shell", path: "./scripts/init_ubuntu.sh", args: "vagrant"
    ubuntu_bionic.vm.box = "ubuntu/bionic64"
  end
  config.vm.define "ubuntu_focal" do |ubuntu_focal|
    ubuntu_focal.vm.provision "shell", path: "./scripts/init_ubuntu.sh", args: "vagrant"
    ubuntu_focal.vm.box = "ubuntu/focal64"
  end
  config.vm.define "mint" do |mint|
    mint.vm.provision "shell", path: "./scripts/init_mint.sh", args: "vagrant"
    mint.vm.box = "mrlesmithjr/linuxmint-19.3"
  end
end