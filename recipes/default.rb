#
# Cookbook Name:: Subread
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
#######################################################

include_recipe 'build-essential'

#######################################################
# here for use by serverspec

magic_shell_environment 'SUBREAD_VERSION' do
  value node['Subread']['version']
end

magic_shell_environment 'SUBREAD_INSTALL_PATH' do
  value node['Subread']['install_path']
end

#######################################################
# package install

package ['zlib-devel', 'tar'] do
  action :install
end

#######################################################

# log 'node filename = ' + node['Subread']['filename']
# log 'node url = ' + node['Subread']['url']

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']}" do
  source node['Subread']['url']
  action :create_if_missing
end

execute 'extract tar ball to install directory' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']} -C #{node['Subread']['install_path']}"
  cwd node['Subread']['install_path']
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['dirname']}") }
end

execute 'make subread' do
  command 'make -f Makefile.Linux'
  cwd "#{node['Subread']['install_path']}/#{node['Subread']['dirname']}/src"
  not_if { ::File.exist?('../bin/exactSNP') }
end

# cannot use link with wild cards
execute 'create symbolic links in PATH to subread executables' do
  command "ln -s -f #{node['Subread']['install_path']}/#{node['Subread']['dirname']}/bin/* ."
  cwd node['Subread']['bin_path']
end

execute 'make subread symbolic links executable' do
  command "chmod -R 755 #{node['Subread']['install_path']}/bin/*"
  cwd node['Subread']['bin_path']
end

#######################################################
#######################################################
