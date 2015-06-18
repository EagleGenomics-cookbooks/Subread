require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('which exactSNP') do
  its(:exit_status) { should eq 0 }
end

