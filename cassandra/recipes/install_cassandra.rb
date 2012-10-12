rightscale_marker :begin

bash "download_cassandra" do
  flags "-ex"
  cwd "/tmp"
  code <<-EOM
    wget -q http://stefhen-rightscale/apache-cassandra-1.1.5-bin.tar.gz
  EOM
end

bash "install_cassandra" do
  flags "-ex"
  cwd "/tmp"
  code <<-EOM
    tar xf apache-cassandra-1.1.5-bin.tar.gz -C /usr/local
  EOM
end
