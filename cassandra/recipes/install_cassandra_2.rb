rightscale_marker :begin

p = package "cassandra" do
  action :nothing
end
p.run_action(:install)

rightscale_marker :end
