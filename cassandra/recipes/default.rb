#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

include_recipe "cassandra::install_cassandra"

rightscale_marker :end
