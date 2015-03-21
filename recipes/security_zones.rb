# https://support.microsoft.com/en-us/kb/182569
if platform?('windows')
  security_zones =  node['ie']['zone']
  policy_key = 'HKLM\\Software\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones'

  security_zones['local_home'].each do |k, v|
    registry_key "#{policy_key}\\0" do
      values [{ name: k, type: :dword, data: v }]
      recursive true
      action :create
    end
  end

  security_zones['internet'].each do |k, v|
    registry_key "#{policy_key}\\3" do
      values [{ name: k, type: :dword, data: v }]
      recursive true
      action :create
    end
  end

  security_zones['local_internet'].each do |k, v|
    registry_key "#{policy_key}\\1" do
      values [{ name: k, type: :dword, data: v }]
      recursive true
      action :create
    end
  end

  security_zones['trusted_sites'].each do |k, v|
    registry_key "#{policy_key}\\2" do
      values [{ name: k, type: :dword, data: v }]
      recursive true
      action :create
    end
  end

  security_zones['restricted_sites'].each do |k, v|
    registry_key "#{policy_key}\\4" do
      values [{ name: k, type: :dword, data: v }]
      recursive true
      action :create
    end
  end

else
  log 'Recipe ie::security_zones is only available for Windows platforms!' do
    level :warn
  end
end
