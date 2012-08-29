
# Install compass and dependencies

%w[compass chunky_png oily_png compass-rgbapng].each do |p|
  gem_package "#{p}" do
    action :install
    gem_binary "/usr/bin/gem"
  end
end