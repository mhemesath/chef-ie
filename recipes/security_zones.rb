if platform?('windows')
  reg_path = "Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones"
  %w(HKCU HKLM).each do |hkey|
    node['ie']['internet_zone'].each do |k, v|
      registry_key "#{hkey}\\#{reg_path}\\3" do
        values [{ name: k, type: :dword, data: v }]
        action :create
      end
    end

    node['ie']['local_internet_zone'].each do |k, v|
      registry_key "#{hkey}\\#{reg_path}\\1" do
        values [{ name: k, type: :dword, data: v }]
        action :create
      end
    end

    node['ie']['trusted_sites_zone'].each do |k, v|
      registry_key "#{hkey}\\#{reg_path}\\2" do
        values [{ name: k, type: :dword, data: v }]
        action :create
      end
    end

    node['ie']['restricted_sites_zone'].each do |k, v|
      registry_key "#{hkey}\\#{reg_path}\\4" do
        values [{ name: k, type: :dword, data: v }]
        action :create
      end
    end
  end
else
  log 'Recipe ie::security_zones is only available for Windows platforms!' do
    level :warn
  end
end
