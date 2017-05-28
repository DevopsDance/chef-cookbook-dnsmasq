include_recipe 'devopsdance-dnsmasq' # ~FC007

dnsmasq_conf 'dns-forward-max' do
  value 16_384
  action :create
end
