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
  a = apt_repository "cassandra-repo" do
    uri "http://www.apache.org/dist/cassandra/debian"
    components ["11x", "main"]
    keyserver "pgp.mit.edu"
    key "4BD736A82B5C1B00"
    action :nothing
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end
  a.run_action(:add)
end

# Installing the cassandra debian package also installs openjdk.
# Oracle java is already installed at /usr/lib/jvm/java-6-sun and should be used
# for $JAVA_HOME instead.

p = package "cassandra" do
  action :nothing
end
p.run_action(:install)

rightscale_marker :end
