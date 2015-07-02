require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file("/usr/local/subread-#{ENV['SUBREAD_VERSION']}-source") do
  it { should be_directory }
end

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
