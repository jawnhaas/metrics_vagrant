## Info ##
This is a sample Vagrant configuration which provisions a server instance with PHP, Apache and MySQL using Chef.

## Project ##
All files referenced are documented throughout, below is an overview of each file touched.

#### Vagrantfile ####
[metrics_example/VagrantFile](https://github.com/jawnhaas/metrics_example/blob/master/Vagrantfile)
sets some configuration values in the chef.json section, sets document paths and base VM configuration.

#### Roles ####
[metrics_example/roles/app_server.rb](https://github.com/jawnhaas/metrics_example/blob/master/roles/app_server.rb)
this is a role that setups up an app server

[metrics_example/roles/example.rb](https://github.com/jawnhaas/metrics_example/blob/master/roles/example.rb)
this is a role that extends the app-role and setups the rjmetrics recipe

#### Cookbooks ####
[metrics_example/my_cookbooks/rjmetrics/metadata.rb](https://github.com/jawnhaas/metrics_example/blob/master/cookbooks/rjmetrics/metadata.rb)
is an overview of the cookbook listing the dependancies required for it to funciton. I downloaded the dependancies needed from [Chef Supermarket](https://community.opscode.com/cookbooks).

[metrics_example/my_cookbooks/rjmetrics/recipes/default.rb](https://github.com/jawnhaas/metrics_example/blob/master/my_cookbooks/rjmetrics/recipes/default.rb)
this recipe creates the connection string, database, sets permissions, and imports a SQL file for data. The SQL import is done for for the sake of the demo, so it runs without additional configuration. Normally i would not include data imports in configuration management system.


[metrics_example/cookbooks/rjmetrics/templates/default/site.conf.erb](https://github.com/jawnhaas/metrics_example/blob/master/cookbooks/rjmetrics/templates/default/site.conf.erb)
is a ruby erb template that is used to setup the vhost document root set via the Vagrantfile.

## Requirements ##
- Virtual Box
- Vagrant ~1.1

## Setup ##
First clone the metrics_example repository, and make that your working directory.

	git clone https://github.com/jawnhaas/metrics_example.git
    cd metrics_example
    vagrant plugin install vagrant-omnibus
    vagrant up

Open up http://localhost:8080 in a browser.
