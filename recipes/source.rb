#
# Cookbook Name:: Subread
# Recipe:: source
#
# Copyright 2015, Eagle Genomics Ltd, All Rights Reserved.

log 'Starting Subread recipe'

include_recipe 'build-essential'

package ['zlib-devel'] do
    action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']}" do
  source node['Subread']['url']
  action :create_if_missing
end

execute "cp #{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']} #{node['Subread']['install_path']}" do
  cwd Chef::Config[:file_cache_path]
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['filename']}") }
end

execute "tar zxvf #{node['Subread']['filename']}" do
  cwd node['Subread']['install_path']
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['dirname']}") }
end

execute "make -f Makefile.Linux" do
  cwd "#{node['Subread']['install_path']}/#{node['Subread']['dirname']}/src"
  not_if { ::File.exist?('../bin/exactSNP') }
end

execute "ln -s #{node['Subread']['install_path']}/#{node['Subread']['dirname']}/bin/* ." do
  cwd node['Subread']['bin_path']
end

log 'Finished Subread recipe'
