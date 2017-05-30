include_recipe 'devopsdance-dnsmasq' # ~FC007

dnsmasq_conf 'dns-forward-max' do
  value 16_384
  action :create
end

dnsmasq_conf 'server' do
  value '8.8.8.8'
  action :create
end

dnsmasq_conf 'server' do
  value '8.8.4.4'
  action :create
end

dnsmasq_conf 'server' do
  value '127.0.0.1'
  action :delete
end
