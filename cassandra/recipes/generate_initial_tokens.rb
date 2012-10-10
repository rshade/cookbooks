#
# Cookbook Name:: cassandra
# Recipe:: generate_initial_tokens
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

log "NODE TOTAL: #{node['cassandra']['node_total']}"
log "NODE NUM:   #{node['cassandra']['node_number']}"

token = nil
ruby "generate_initial_tokens" do
  token = `/usr/bin/token-generator -n #{node['cassandra']['node_total']}`.to_a.grep(/Node #0?#{node['cassandra']['node_number']}:/).first.split.last
end

log "TOKEN: :#{token}:"
right_link_tag "cassandra:initial_token=#{token}"

rightscale_marker :end
