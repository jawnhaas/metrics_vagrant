## Info ##
This is a sample Vagrant configuration which provisions a server instance with PHP, Apache and MySQL using Chef.

## Project ##
All files referenced are documented throughout, below is an overview of each file touched. To make the project easy to run, I manually downloaded all the cookbook dependancies from [Chef Supermarket](https://community.opscode.com/cookbooks). Normally, I would use a package management system like Library or Berkshire. 

#### Vagrantfile ####
[Vagrantfile](https://github.com/jawnhaas/metrics_vagrant/blob/master/Vagrantfile)
sets some configuration values in the chef.json section, sets document paths and base VM configuration.

[Vagrantfile.chef](https://github.com/jawnhaas/metrics_vagrant/blob/master/Vagrantfile.chef)
changes the ssl_verify_mode to :verify_peer from the default :verify_none to get rid fo the warnings during provisioning

#### Roles ####
[app_server.rb](https://github.com/jawnhaas/metrics_vagrant/blob/master/roles/app_server.rb)
this is a role that setups up a basic app server which runs apache, mysql and PHP.

[example.rb](https://github.com/jawnhaas/metrics_vagrant/blob/master/roles/example.rb)
this is a role that extends the app-server role and sets up the rjmetrics recipe

#### Cookbooks ####
[metadata.rb](https://github.com/jawnhaas/metrics_vagrant/blob/master/my_cookbooks/rjmetrics/metadata.rb)
is an overview of the cookbook listing the dependancies required for it to funciton. 

[default.rb](https://github.com/jawnhaas/metrics_vagrant/blob/master/my_cookbooks/rjmetrics/recipes/default.rb)
this recipe creates the connection string, database, sets permissions, and imports a SQL file for data. The SQL import is done for for the sake of the demo, so it runs without additional configuration. Normally i would not include data imports in a configuration management system.

[site.conf.erb](https://github.com/jawnhaas/metrics_vagrant/blob/master/my_cookbooks/rjmetrics/templates/default/site.conf.erb)
is a ruby erb template that is used to setup the vhost document root set via the Vagrantfile.

## Requirements ##
- Virtual Box
- Vagrant ~1.1

## Setup ##
First clone the metrics_example repository, and make that your working directory.

	git clone https://github.com/jawnhaas/metrics_vagrant.git
    cd metrics_vagrant
    vagrant plugin install vagrant-omnibus
    vagrant up

Open up http://localhost:8080 in a browser.
