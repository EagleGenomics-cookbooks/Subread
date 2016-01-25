default['Subread']['version'] = '1.4.6-p5'
default['Subread']['dirname'] = "subread-#{node['Subread']['version']}-source"
default['Subread']['filename'] = "#{node['Subread']['dirname']}.tar.gz"
default['Subread']['url'] = "http://sourceforge.net/projects/subread/files/subread-#{node['Subread']['version']}/#{node['Subread']['filename']}"
default['Subread']['install_path'] = '/usr/local'
default['Subread']['bin_path'] = '/usr/local/bin'
