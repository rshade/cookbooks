#
# Cookbook Name:: cassandra
# Recipe:: generate_initial_token
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

token = nil
ruby "generate_initial_token" do
  token = `/usr/bin/token-generator -n #{node['cassandra']['node_total']}`.to_a.grep(/Node #0?#{node['cassandra']['node_number']}:/).first.split.last
end

rightscale_marker :end
