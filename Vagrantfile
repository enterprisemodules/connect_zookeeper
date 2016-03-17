# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "enterprisemodules/centos-6.6-64-puppet"
  config.vm.hostname = 'test.example.com'

  config.vm.provision :shell, :inline => "yum install patch -y;/opt/puppetlabs/puppet/bin/gem install zk"
  config.vm.provision :shell, :inline => "puppet module install hajee-connect"
  config.vm.provision :shell, :inline => "rm -rf /etc/puppetlabs/code/environments/production/modules/zookeeper_connect; ln -s /vagrant /etc/puppetlabs/code/environments/production/modules/zookeeper_connect"
  config.vm.provision :shell, :inline => "ln -sf /vagrant/hiera.yaml /etc/puppetlabs/puppet/hiera.yaml"
end
