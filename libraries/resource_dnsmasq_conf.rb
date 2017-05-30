class Chef
  class Resource
    class DnsmasqConf < Chef::Resource::LWRPBase
      provides :dnsmasq_conf
      resource_name :dnsmasq_conf
      actions(:create, :delete)
      default_action(:create)

      attribute(:param, kind_of: String, name_property: true)
      attribute(:value, kind_of: [String, Integer], default: nil)
    end
  end
end
