require 'serverspec'
#require 'spec_helper'

# Required by serverspec
set :backend, :exec

describe file("/usr/local/subread-1.4.6-p1-source.tar.gz") do
  it { should be_file }
end

describe file("/usr/local/subread-1.4.6-p1-source") do
  it { should be_directory }
end

['/usr/local/bin/exactSNP','/usr/local/bin/featureCounts','/usr/local/bin/subindel','/usr/local/bin/subjunc','/usr/local/bin/subread-align','/usr/local/bin/subread-buildindex'].each do |fileExecutable|
  describe file(fileExecutable) do
    it { should be_file }
     it { should be_executable }
  end
  
  
end 

['/usr/local/bin/utilities/coverageCount','/usr/local/bin/utilities/globalReassembly','/usr/local/bin/utilities/propmapped','/usr/local/bin/utilities/qualityScores','/usr/local/bin/utilities/removeDup','/usr/local/bin/utilities/subread-fullscan','/usr/local/bin/utilities/subtools'].each do |fileExecutable|
  describe file(fileExecutable) do
    it { should be_file }
    it { should be_executable }
  end
end 

set :path, '/usr/local/bin/:$PATH'

describe command('which exactSNP') do
 its(:exit_status) { should eq 0 }
end
