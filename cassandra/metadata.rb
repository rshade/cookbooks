maintainer       "RightScale Inc."
maintainer_email "ps@rightscale.com"
license          "All rights reserved"
description      "Installs/Configures cassandra"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.3"

depends "apt"
depends "rightscale"

recipe "cassandra::install_cassandra"      , "Add the Apache Cassandra repo and install software."
recipe "cassandra::install_config_files"   , "Install Cassandra config files from Chef templates."
recipe "cassandra::generate_initial_token" , "Generate initial Cassandra token for the node."



attribute "cassandra/node_total",
  :description  => "Total number of nodes in the Cassandra ring.",
  :recipes      => [ "cassandra::generate_initial_token" ],
  :type         => "string",
  :display_name => "node_total",
  :required     => "required"

attribute "cassandra/node_number",
  :description  => "Cassandra ring node position (Should be between 1..N).",
  :recipes      => [ "cassandra::generate_initial_token" ],
  :type         => "string",
  :display_name => "node_number",
  :required     => "required"
