require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

pseudo_node = PseudoNode.new

puts 'loaded config'
#puts pseudo_node.default['Subread']['version']

describe file("/usr/local/subread-1.4.6-p1-source.tar.gz") do
  it { should be_file }
end

#describe file("/usr/local/subread-#{pseudo_node.default['Subread']['version']}-source.tar.gz") do
#  it { should be_file }
#end

describe file("/usr/local/subread-1.4.6-p1-source") do
  it { should be_directory }
end

set :path, '/usr/local/bin/:$PATH'

['exactSNP','featureCounts','subindel','subjunc','subread-align','subread-buildindex'].each do |fileExecutable|

  describe command("which #{fileExecutable}") do
    its(:exit_status) { should eq 0 }
  end
  
  filePath = '/usr/local/bin/' + fileExecutable
  
  describe file(filePath) do
    it { should be_file }
    it { should be_executable }
  end
end 

['coverageCount','globalReassembly','propmapped','qualityScores','removeDup','subread-fullscan','subtools'].each do |fileExecutable|
  filePath = '/usr/local/bin/utilities/' + fileExecutable
  
  describe file(filePath) do
    it { should be_file }
    it { should be_executable }
  end
end
