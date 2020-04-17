# # encoding: utf-8

# Inspec test for recipe Subread::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe directory('/usr/local/subread-2.0.0-Linux-x86_64') do
  it { should exist }
end

# Check that executable is in the path
describe command('which featureCounts') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match('featureCounts') }
end

# Check that Subread works
describe command('featureCounts -v') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match('featureCounts v2.0.0') }
end
