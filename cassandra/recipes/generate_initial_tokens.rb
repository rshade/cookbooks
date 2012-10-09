#
# Cookbook Name:: cassandra
# Recipe:: generate_initial_tokens
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

ruby_block "generate_initial_tokens" do
  block do
    `/usr/bin/token-generator -n #{node['cassandra']['node_total']}`
  end
end
