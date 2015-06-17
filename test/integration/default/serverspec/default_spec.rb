require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file("/usr/local/subread-1.4.6-p1-source.tar.gz") do
  it { should be_file }
end


describe command('which exactSNP') do
  its(:exit_status) { should eq 0 }
end
