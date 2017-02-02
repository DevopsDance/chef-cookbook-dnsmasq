class Chef
  class Provider
    class DnsmasqConf < Chef::Provider::LWRPBase
      def apply_configuration
        params = run_context.resource_collection.select do |item|
          item.is_a? Chef::Resource::DnsmasqConf
        end

        template '/etc/dnsmasq.d/dns.conf' do
          source 'dns.conf.erb'
          owner 'root'
          group 'root'
          mode '0644'
          variables params: params
          notifies :restart, 'service[dnsmasq]', :delayed
          action :create
        end
      end

      action :create do
        apply_configuration
      end

      action :delete do
        apply_configuration
      end
    end
  end
end
