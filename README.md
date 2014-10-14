## Info ##
This is a sample Vagrant configuration which provisions a server instance with PHP, Apache and MySQL using Chef.

## Project ##
All files referenced are documented throughout, below is an overview of each file touched.

#### Vagrantfile ####
[metrics_example/VagrantFile](https://github.com/jawnhaas/metrics_example/blob/master/Vagrantfile)
sets some configuration value in the chef.json section for use in the rjmetrics cookbook, to keep configuration values out of the recipe.

#### Roles ####
[metrics_example/roles/example.rb](https://github.com/jawnhaas/metrics_example/blob/master/roles/example.rb)
this is a role that sets up the rjmetrics application  

#### Cookbooks ####
[metrics_example/cookbooks/rjmetrics/metadata.rb](https://github.com/jawnhaas/metrics_example/blob/master/cookbooks/rjmetrics/metadata.rb)
 is an overview of the cookbook listing the dependancies required for it to funciton. I downloaded the dependancies needed from [Chef Supermarket](https://community.opscode.com/cookbooks).

[metrics_example/cookbooks/rjmetrics/recipes/site.rb](https://github.com/jawnhaas/metrics_example/blob/master/cookbooks/rjmetrics/recipes/default.rb)
this setups up the vhost for the site.

[metrics_example/cookbooks/rjmetrics/recipes/import.rb](https://github.com/jawnhaas/metrics_example/blob/master/cookbooks/rjmetrics/recipes/default.rb)
this recipe creates the connect, database, sets permissions, and imports a SQL file for data.

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
