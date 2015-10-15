#!/bin/bash
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update
apt-get -y install puppet git
cd /etc
tar xzf /tmp/puppet.tar.gz
puppet apply --modulepath=/etc/puppet/modules /etc/puppet/manifests/site.pp
