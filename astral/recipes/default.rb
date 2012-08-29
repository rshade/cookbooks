

rightscale_marker :begin

# Install compass and dependencies

%w[compass chunky_png oily_png compass-rgbapng].each do |p|
  gem_package "#{p}" do
    action :install
    gem_binary "/usr/bin/gem"
  end
end

phpunit_packages = %w[
  File_Iterator-1.3.1.tgz 
  Text_Template-1.1.1.tgz 
  PHP_Timer-1.0.2.tgz 
  YAML-1.0.6.tgz 
  PHP_TokenStream-1.1.3.tgz 
  PHP_CodeCoverage-1.1.3.tgz 
  PHPUnit_MockObject-1.1.1.tgz 
  PHP_Invoker-1.1.0.tgz
]

# Copy phpunit packages from cookbook to /tmp
phpunit_packages.each do |file|
  cookbook_file "/tmp/#{file}" do
    source "#{file}"
  end
end


# install phpunit packages using pear

phpunit_packages.each do |tgz|
  bash "install_#{tgz}" do
    flags "-ex"
    cwd "/tmp"
    code <<-EOM
      pear install "#{tgz}"
    EOM
  end
end

rightscale_marker :end
