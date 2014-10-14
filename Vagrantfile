# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every vagrant virtual env requires a box to build off of
  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.host_name = "precise64.local"
  config.omnibus.chef_version = :latest
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3307
  # shared folders between vagrant and host
  config.vm.synced_folder  "data", "/data"
  config.vm.synced_folder  "webroot", "/webroot"

  config.vm.provision :shell, :inline => "apt-get clean; apt-get update"
  config.vm.provision "chef_solo" do |chef|
    # changing the ssl_verify_mode to :verify_peer from the default :verify_none to get rid fo the warning during provisioning
    chef.custom_config_path = "Vagrantfile.chef"
    # setting cookbook and roles paths
    chef.cookbooks_path = ["my_cookbooks", "cookbooks"]
    chef.roles_path = "roles"
    # adding role to run
    chef.add_role "example"
    # Setting configuration values for the rjmetrics recipe.
    # 1. define password for MySQL site
    # 2. Set values for setting up a website
    chef.json = {
      "mysql" => {
          "server_root_password" => "d1fa4a7da52440d6a6e86e9780233271"
      },
      "site" => {
        "database" => "rjmetrics",
        "web_root" => "/webroot"
      }
    }

  end

  # VirtualBox Specific Customization
  config.vm.provider :virtualbox do |vb|
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize ["modifyvm", :id, "--memory", "4096"]
  end
end
