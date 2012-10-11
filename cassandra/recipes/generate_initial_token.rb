#
# Cookbook Name:: cassandra
# Recipe:: generate_initial_token
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

ruby "generate_initial_token" do
#  node.set['cassandra']['initial_token'] = `/usr/bin/token-generator -n #{node['cassandra']['node_total']}`.to_a.grep(/Node #0?#{node['cassandra']['node_number']}:/).first.split.last
  node.set['cassandra']['initial_token'] = "this_is_the_initial_token"
end

rightscale_marker :end
