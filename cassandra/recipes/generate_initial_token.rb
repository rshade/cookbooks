#
# Cookbook Name:: cassandra
# Recipe:: generate_initial_token
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

ruby_block "generate_initial_token" do
  block do
    node.set['cassandra']['initial_token'] = %x[/usr/bin/token-generator -n #{node['cassandra']['node_total']}].to_a.grep(/Node #0?#{node['cassandra']['node_number']}:/).first.split.last
  end
end

rightscale_marker :end
