BFCACHE_32 = 'HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE'
BFCACHE_64 = 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE'

if platform?('windows')
  bfcache = node['kernel']['machine'] == 'x86_64' ? BFCACHE_64 : BFCACHE_32

  if node['ie']['back_forward_cache']
    registry_key bfcache do
      values [{ name: 'iexplore.exe', type: :dword, data: 0 }]
      action :create
    end
  else
    registry_key bfcache do
      values [{ name: 'iexplore.exe', type: :dword }]
      action :delete
    end
  end
else
  log 'Recipe ie::back_forward_cache is only available for Windows platforms!' do
    level :warn
  end
end
