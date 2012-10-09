#
# Cookbook Name:: cassandra
# Recipe:: install_config_files
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

template "/etc/cassandra/cassandra.yaml" do
  source "cassandra.yaml.erb"
end

rightscale_marker :end
