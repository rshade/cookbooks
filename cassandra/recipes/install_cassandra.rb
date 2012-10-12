rightscale_marker :begin

bash "download_cassandra" do
  flags "-ex"
  cwd "/tmp"
  code <<-EOM
    wget -q http://stefhen-rightscale.s3.amazonaws.com/apache-cassandra-1.1.5-bin.tar.gz
  EOM
end

bash "install_cassandra" do
  flags "-ex"
  cwd "/tmp"
  code <<-EOM
    tar xf apache-cassandra-1.1.5-bin.tar.gz -C /usr/local
  EOM
  notifies :create, "ruby_block[generate_initial_token]", :immediately
  not_if "test -e /tmp/initial_token-#{node['rightscale']['instance_uuid']}"
end

log "NODE_NUMBER: #{node['cassandra']['node_number']}"
log "NODE_TOTAL:  #{node['cassandra']['node_total']}"

ruby_block "generate_initial_token" do
  block do
    file = File.open("/tmp/initial_token-#{node['rightscale']['instance_uuid']}", 'w')
    file.write(%x[/usr/local/apache-cassandra-1.1.5/tools/bin/token-generator -n #{node['cassandra']['node_total']}].to_a.grep(/Node #0?#{node['cassandra']['node_number']}:/).first.split.last)
    file.close
  end
  action :nothing
end

rightscale_marker :end

