def ie_version
  if platform_family?('windows')
    Registry.get_values('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer', 'svcVersion')
  end
end
