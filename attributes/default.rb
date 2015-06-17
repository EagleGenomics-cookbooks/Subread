default['Subread']['version'] = '1.4.6-p1'
default['Subread']['dirname'] = "subread-#{node['Subread']['version']}"
default['Subread']['filename'] = "#{node['Subread']['dirname']}-Linux-x86_64.tar.gz"
default['Subread']['url'] = "http://sourceforge.net/projects/subread/files/#{node['Subread']['dirname']}/#{node['Subread']['filename']}/download"
default['Subread']['install_path'] = '/usr/local/bin/'
