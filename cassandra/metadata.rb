maintainer       "RightScale Inc."
maintainer_email "ps@rightscale.com"
license          "All rights reserved"
description      "Installs/Configures cassandra"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "apt"
depends "rightscale"

recipe "cassandra::default", "Entry point for Cassandra installation"
recipe "cassandra::install_cassandra", "Add the Apache Cassandra repo and install software."
recipe "cassandra::install_config_files", "Install Cassandra config files from Chef templates."
recipe "cassandra::set_tags", "sets tags"
