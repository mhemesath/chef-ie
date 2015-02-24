reg_root = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones'
if platform?('windows')
  if registry_key_exists?(reg_root)
    registry_key "#{reg_root}\\3" do
      values [{
        name: '2500',
        type: :dword,
        data: node['ie']['enable_protected_mode']['internet'] ? 0 : 3
      }]
      action :create
    end

    registry_key "#{reg_root}\\1" do
      values [{
        name: '2500',
        type: :dword,
        data: node['ie']['enable_protected_mode']['local_internet'] ? 0 : 3
      }]
      action :create
    end

    registry_key "#{reg_root}\\2" do
      values [{
        name: '2500',
        type: :dword,
        data: node['ie']['enable_protected_mode']['trusted_sites'] ? 0 : 3
      }]
      action :create
    end

    registry_key "#{reg_root}\\4" do
      values [{
        name: '2500',
        type: :dword,
        data: node['ie']['enable_protected_mode']['restricted_sites'] ? 0 : 3
      }]
      action :create
    end
  else
    log 'Recipe ie::enable_protected_mode requires Internet Explorer to be installed!' do
      level :warn
    end
  end
else
  log 'Recipe ie::enable_protected_mode is only available for Windows platforms!' do
    level :warn
  end
end
