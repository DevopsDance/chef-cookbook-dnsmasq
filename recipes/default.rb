include_recipe 'chef-sugar'

if ubuntu?
  include_recipe 'ubuntu'
elsif debian?
  include_recipe 'apt'
else
  raise 'Unsupported platform'
end

package 'dnsmasq' do
  action :install
end

file '/etc/dnsmasq.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-CONTENT
# This file is delivered by CHEF.
# Please keep the configuration files in /etc/dnsmasq.d/*.conf files.
#
  CONTENT
  notifies :restart, 'service[dnsmasq]', :delayed
  action :create
end

service 'dnsmasq' do
  action :start
end
