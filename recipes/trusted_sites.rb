reg_root = 'HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains'
if platform?('windows')
  if registry_key_exists?(reg_root)
    node['ie']['trusted_sites'].each do |site|
      uri = URI.parse(site)
      subdomains = uri.host.gsub('*.', '').split('.').reverse
      reg_key = "#{reg_roots}\\#{subdomains[1]}.#{subdomains[0]}"
      reg_key = "#{reg_key}\\#{subdomains.drop(2).join('\\')}" if subdomains.count > 2
      registry_key reg_key do
        values [{
          name: uri.scheme,
          type: :dword,
          data: 2
        }]
        action :create
      end
    end
  else
    log 'Recipe ie::trusted_sites requires Internet Explorer to be installed!' do
      level :warn
    end
  end
else
  log 'Recipe ie::trusted_sites is only available for Windows platforms!' do
    level :warn
  end
end
