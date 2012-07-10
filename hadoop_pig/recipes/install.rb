#
# Cookbook Name:: hadoop_pig
# Recipe:: default
#
# Copyright 2012, Rightscale Inc
#
# All rights reserved - Do Not Redistribute
#

bash "download_pig" do
  cwd "/tmp"
  flags "-ex"
  code <<-EOM
    wget -q "#{node[:pig][:source]}"
  EOM
end
