# chef-cookbook-dnsmasq

Install and configure DNSmasq.

## Requirements

Chef `~> 12` is required.

## Recipes
### default

The default recipe installs and starts `dnsmasq` service.

## Resources
### dnsmasq_conf

*Actions*

- `:create` (default action) Creates new configuration.
- `:delete` Removes given configuration.

*Parameters*

- `action`
- `param` (the name param)
- `value`

*Examples*

```
dnsmasq_conf 'dns-foward-max' do
    value 16_384
    action :create
end

dnsmasq_conf 'no-resolv' do
    action :create
end
```
