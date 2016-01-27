name 'Subread'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures Subread'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.2'

supports 'centos', '= 6.5'

depends 'build-essential'
depends 'magic_shell'
