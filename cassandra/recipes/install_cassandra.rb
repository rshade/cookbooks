#
# Cookbook Name:: cassandra
# Recipe:: install_cassandra
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

case node['platform']
when "ubuntu"
  include_recipe "apt"
  apt_repository "cassandra-repo" do
    uri "http://www.apache.org/dist/cassandra/debian"
    components ["11x", "main"]
    keyserver "pgp.mit.edu"
    key "4BD736A82B5C1B00"
    action :add
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end
end

package "cassandra"

rightscale_marker :end
