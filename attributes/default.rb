default['Subread']['version'] = '2.0.0'
default['Subread']['basename'] = "subread-#{node['Subread']['version']}-Linux-x86_64"
default['Subread']['filename'] = "#{node['Subread']['basename']}.tar.gz"
# this is the url
# https://downloads.sourceforge.net/project/subread/subread-2.0.0/subread-2.0.0-Linux-x86_64.tar.gz
default['Subread']['url'] = "http://downloads.sourceforge.net/project/subread/subread-#{node['Subread']['version']}/#{node['Subread']['filename']}"
default['Subread']['install_path'] = '/usr/local'
default['Subread']['dir'] = "#{node['Subread']['install_path']}/#{node['Subread']['basename']}"
default['Subread']['bin'] = "#{node['Subread']['dir']}/bin"
