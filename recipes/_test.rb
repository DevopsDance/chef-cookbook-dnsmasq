include_recipe 'dnsmasq'

dnsmasq_conf 'dns-forward-max' do
  value 16_384
  action :create
end
