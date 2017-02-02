class Chef
  class Resource
    class DnsmasqConf < Chef::Resource
      provides :dnsmasq_conf

      def initialize(name, run_context=nil)
        super
        @resource_name = :dnsmasq_conf
        @allowed_actions = [
          :create,
          :delete
        ]
        @action = :create
        @name = name
        @param = name
        @value = nil
      end

      def name(arg=nil)
        set_or_return(:name, arg, kind_of: String)
      end

      def param(arg=nil)
        set_or_return(:param, arg, kind_of: String)
      end

      def value(arg=nil)
        set_or_return(:value, arg, kind_of: String)
      end
    end
  end
end
