Vagrant.configure(2) do |config|
  #config.vm.box = "centos/7"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.define "ak1" do |m|
    m.vm.box = "centos/7"
    m.vm.network "private_network", ip: "192.168.7.11"
    m.vm.provision "shell", inline: "hostnamectl set-hostname ak1"
    m.vm.provision "shell", inline: "sudo bash /vagrant/build/master.sh"
  end

  config.vm.define "ak2" do |s1|
    s1.vm.box = "centos/7"
    s1.vm.network "private_network", ip: "192.168.7.12"
    s1.vm.provision "shell", inline: "hostnamectl set-hostname ak2"
    s1.vm.provision "shell", inline: "sudo bash /vagrant/build/slave.sh"
  end

  #config.vm.define "ak3" do |s2|
  #  s2.vm.box = "centos/7"
  #  s2.vm.network "private_network", ip: "192.168.7.13"
  #  s2.vm.provision "shell", inline: "hostnamectl set-hostname ak3"
  #  s2.vm.provision "shell", inline: "sudo bash /vagrant/build/slave.sh"
  #end

  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = "1"
  end
  #config.vm.provision :shell, :path => "ssh-setup.sh"
end
