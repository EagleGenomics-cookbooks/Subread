#
# Cookbook:: Subread
# Recipe:: default
#
# Copyright:: 2019, Eagle Genomics Ltd, All Rights Reserved.

include_recipe 'tar'

tar_extract node['Subread']['url'] do
  target_dir node['Subread']['install_path']
  creates node['Subread']['dir']
end

magic_shell_environment 'PATH' do
  filename 'star'
  value "$PATH:#{node['Subread']['bin']}"
end

magic_shell_environment 'SUBREAD_VERSION' do
  value node['Subread']['version']
end
