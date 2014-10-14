# Setting mysql connection info
mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

# Creating mysql database
mysql_database node['site']['database'] do
  connection mysql_connection_info
  action :create
end

# Setting permissions on the database
mysql_database_user "root" do
  connection mysql_connection_info
  password node['mysql']['server_root_password']
  database_name node['site']['database']
  host 'localhost'
  privileges [:select,:update,:insert, :delete]
  action [:create, :grant]
end

execute "import" do
  #command "mysql -u root -p"+node['mysql']['server_root_password'] +" rjmetrics < /data/people.sql"
  command "mysql -u root -p"+node['mysql']['server_root_password']+" "+node['site']['database']+" < /data/people.sql"
  action :run
end

web_app "site" do
  # where the site will live
   docroot node['site']['web_root'];
  # apache virtualhost definition
   template "site.conf.erb"
end
