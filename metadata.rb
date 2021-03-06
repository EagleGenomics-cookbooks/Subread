name 'Subread'
maintainer 'Eagle Genomics Ltd'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache-2.0'
description 'Installs/Configures Subread'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 14.10'
supports 'ubuntu', '= 18.04'
source_url 'https://github.com/EagleGenomics-cookbooks/Subread'
issues_url 'https://github.com/EagleGenomics-cookbooks/Subread/issues'
version '1.1.0'

depends 'magic_shell'
depends 'tar'
