include_recipe 'ubuntu'

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

systemd_service 'dnsmasq' do
  description 'dnsmasq - A lightweight DHCP and caching DNS server'
  after %w(network.target)
  install do
    wanted_by 'multi-user.target'
  end
  service do
    type 'forking'
    pid_file '/var/run/dnsmasq/dnsmasq.pid'
    exec_start_pre '/usr/sbin/dnsmasq --test'
    exec_start '/etc/init.d/dnsmasq systemd-exec'
    exec_start_post '/etc/init.d/dnsmasq systemd-start-resolvconf'
    exec_stop '/etc/init.d/dnsmasq systemd-stop-resolvconf'
    exec_reload '/bin/kill -HUP $MAINPID'
    private_tmp true
    protect_system true
    read_write_directories %w(
      /var/run/dnsmasq
    )
    restart 'always'
  end
  action [
    :create,
    :enable
  ]
end

service 'dnsmasq' do
  action [
    :enable,
    :start
  ]
end
