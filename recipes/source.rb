#
# Cookbook Name:: Subread
# Recipe:: source
#
# Copyright 2015, Eagle Genomics Ltd, All Rights Reserved.

include_recipe 'build-essential'

# here for use by serverspec
magic_shell_environment 'SUBREAD_VERSION' do
  value node['Subread']['version']
end

package ['zlib-devel'] do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']}" do
  source node['Subread']['url']
  action :create_if_missing
end

execute "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']} -C #{node['Subread']['install_path']}" do
  cwd node['Subread']['install_path']
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['dirname']}") }
end

execute 'make -f Makefile.Linux' do
  cwd "#{node['Subread']['install_path']}/#{node['Subread']['dirname']}/src"
  not_if { ::File.exist?('../bin/exactSNP') }
end

# cannot use link with wild cards
execute "ln -s -f #{node['Subread']['install_path']}/#{node['Subread']['dirname']}/bin/* ." do
  cwd node['Subread']['bin_path']
end

execute "chmod -R 755 #{node['Subread']['install_path']}/bin/* ." do
  cwd node['Subread']['bin_path']
end
