#
# Cookbook Name:: cassandra
# Recipe:: set_tags
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

server_collection "cassandra_hosts" do
  tags ["cassandra:node_number=*"]
  action :load
end

#right_link_tag "cassandra:node_number=1"

node["server_collection"]["cassandra_hosts"].to_hash.values.each do |t|
  log "NODE_NUMBER: #{RightScale::Utils::Helper.get_tag_value("cassandra:node_number", t)}"
  log "TAGS: #{t}"
end



rightscale_marker :end

