# http://support.microsoft.com/kb/933991
if platform?('windows')
  value = node['ie']['enhanced_security_configuration'] ? 1 : 0

  users = 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}'
  registry_key users do
    values [{ name: 'IsInstalled', type: :dword, data: value }]
    action :create
    only_if { registry_key_exists?(users) }
  end

  administrators = 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}'
  registry_key administrators do
    values [{ name: 'IsInstalled', type: :dword, data: value }]
    action :create
    only_if { registry_key_exists?(administrators) }
  end

  ieharden = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap'
  registry_key ieharden do
    values [{ name: 'IEHarden', type: :dword, data: value }]
    action :create
    only_if { registry_key_exists?(ieharden) }
  end
else
  log 'Recipe ie::enhanced_security_configuration is only available for Windows platforms!' do
    level :warn
  end
end
