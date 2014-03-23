# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Machine setup
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, type: :dhcp

  # Provision using Berkshelf
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[apt]",
        "recipe[ruby_build]",
        "recipe[rbenv::system]",
        "recipe[metasploit]"
    ]

    chef.json = {
      'rbenv' => {
        'rubies'  => ['1.9.3-p484'],
        'global'  => '1.9.3-p484',
        'gems' => {
          '1.9.3-p484' => [
            { 'name'    => 'bundler' }
          ]
        }
      }
    }
  end
end
