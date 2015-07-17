require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file("#{ENV['SUBREAD_INSTALL_PATH']}/subread-#{ENV['SUBREAD_VERSION']}-source") do
  it { should be_directory }
end


['exactSNP', 'featureCounts', 'subindel', 'subjunc', 'subread-align', 'subread-buildindex'].each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end
  
  describe command("#{file_executable} -v") do
    its(:stdout) { should contain(ENV['SUBREAD_VERSION']) }
  end

  file_path = ENV['SUBREAD_INSTALL_PATH'] + '/bin/' + file_executable

  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end
end

# these executables need to be accessible by the main Subread code
['coverageCount', 'globalReassembly', 'propmapped', 'qualityScores', 'removeDup', 'subread-fullscan', 'subtools'].each do |file_executable|
  file_path = ENV['SUBREAD_INSTALL_PATH'] + '/bin/utilities/' + file_executable
  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end
end
