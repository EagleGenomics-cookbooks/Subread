#
# Cookbook Name:: Subread
# Recipe:: source
#
# Copyright 2015, Eagle Genomics Ltd, All Rights Reserved.

include_recipe 'build-essential'

remote_file "#{Chef::Config[:file_cache_path]}/#{node['Subread']['url']}" do
  source node['Subread']['url']
end

execute "cp #{Chef::Config[:file_cache_path]}/#{node['Subread']['filename']} #{node['Subread']['install_path']}" do
  cwd Chef::Config[:file_cache_path]
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['filename']}") }
end

execute "tar zxvf #{node['Subread']['filename']}" do
  cwd "#{node['Subread']['install_path']}"
  not_if { ::File.exist?("#{node['Subread']['install_path']}/#{node['Subread']['dirname']}") }
end


