class Chef
  class Provider
    class DnsmasqConf < Chef::Provider
      provides :dnsmasq_conf

      def load_current_resource
        true
      end

      def params
        Chef.run_context.resource_collection.select do |item|
          item.is_a?(Chef::Resource::DnsmasqConf) && item.action.include?(:create)
        end
      end

      def lookup_service
        begin
          dnsmasq_service = Chef.run_context.resource_collection.find(service: 'dnsmasq')
        rescue
          raise 'Have you included devopsdance-dnsmasq::default?'
        end
        dnsmasq_service
      end

      def action_execute
        conf = Chef::Resource::Template.new '/etc/dnsmasq.d/dns.conf', run_context
        conf.cookbook 'devopsdance-dnsmasq'
        conf.source 'dns.conf.erb'
        conf.variables params: params
        conf.run_action :create

        return unless conf.updated_by_last_action?

        new_resource.updated_by_last_action(true) # ~FC085
        new_resource.notifies(:restart, lookup_service, :delayed)
      end

      def action_create
        action_execute
      end

      def action_delete
        action_execute
      end
    end
  end
end
