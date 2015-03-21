def ie_version
  return unless platform_family?('windows')
  registry_get_values('HKLM\SOFTWARE\Microsoft\Internet Explorer').each do |value|
    return value[:data] if value[:name] == 'svcVersion'
  end
  ''
end
