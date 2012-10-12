#
# Cookbook Name:: cassandra
# Recipe:: add_cassandra_repo
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

case node['platform']
when "ubuntu"
  include_recipe "apt"

  a = apt_repository "cassandra" do
    uri "http://www.apache.org/dist/cassandra/debian"
    components ["11x", "main"]
    keyserver "pgp.mit.edu"
    key "4BD736A82B5C1B00"
    action :nothing
  end
  
  a.run_action(:add)
end

rightscale_marker :end
