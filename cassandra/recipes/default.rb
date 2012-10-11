#
# Cookbook Name:: cassandra
# Recipe:: default
#
# Copyright 2012, RightScale Inc
#
# All rights reserved - Do Not Redistribute
#

rightscale_marker :begin

#include_recipe "cassandra::install_cassandra"
#include_recipe "cassandra::generate_initial_token"
#include_recipe "cassandra::install_config_files"
#include_recipe "cassandra::set_tags"

rightscale_marker :end
