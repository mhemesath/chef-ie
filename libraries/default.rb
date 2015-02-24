def ie_version
  return unless platform_family?('windows')
  Registry.get_values('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer', 'svcVersion')
end
