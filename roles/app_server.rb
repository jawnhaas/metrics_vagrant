name "app_server"

description "Generic Application Server w/ Apache, MySQL and PHP"

default_attributes(
  "apache2" => {
    "default_site_enabled" => false
  }
)

run_list(
  "recipe[apache2]",
  "recipe[apache2::mod_ssl]",
  "recipe[mysql::client]",
  "recipe[mysql::server]",
  "recipe[php]",
  "recipe[php::module_mysql]",
  "recipe[apache2::mod_php5]",
  "recipe[database::mysql]"
)
