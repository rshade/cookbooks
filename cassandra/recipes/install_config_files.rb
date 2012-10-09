#
# Cookbook Name:: cassandra
# Recipe:: install_config_files
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

service "cassandra" do
  action :stop
end

%w[/mnt/ephemeral/cassandra/commitlog /mnt/ephemeral/cassandra/data /mnt/ephemeral/cassandra/saved_caches].each do |dir|
  directory "#{dir}" do
    owner "cassandra"
    group "cassandra"
    mode "755"
    action :create
    recursive true
  end
end

template "/etc/cassandra/cassandra.yaml" do
  source "cassandra.yaml.erb"
  mode "644"
end

template "/etc/cassandra/log4j-server.properties" do
  source "log4j-server.properties.erb"
  mode "644"
end

template "/etc/init.d/cassandra" do
  source "cassandra"
  mode "755"
end

# Remove initial data/log dirs created by install.
%[/var/log/cassandra /var/lib/cassandra].each do |dir|
  directory "#{dir}" do
    action :delete
    recursive true
  end
end

file "/mnt/ephemeral/cassandra/system.log" do
  action :create_if_missing
  owner "cassandra"
  group "cassandra"
end



service "cassandra" do
  action :start
end

rightscale_marker :end
