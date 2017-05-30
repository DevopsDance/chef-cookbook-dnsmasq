describe service('dnsmasq') do
  it { should be_installed }
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/dnsmasq.d/dns.conf') do
  its(:md5sum) { should eq '928cf8cec28da8808b2160fbb2776917' }
end
