name 'dnsmasq'
maintainer 'DevopsDance'
maintainer_email 'team@devops.dance'
license 'All rights reserved'
description 'Installs and configures DNSMasq'
version '1.0.1'
source_url 'https://github.com/DevopsDance/chef-cookbook-dnsmasq'
issues_url 'https://github.com/DevopsDance/chef-cookbook-dnsmasq/issues'
chef_version '~> 12'

depends 'ubuntu'
depends 'systemd'

supports 'ubuntu', '>= 16.04'
