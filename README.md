# IE Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/ie.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-ie.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-ie.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/ie
[travis]: https://travis-ci.org/dhoer/chef-ie
[github]: https://github.com/dhoer/chef-ie/issues

Configures Internet Explorer to aid tools like [Selenium](http://www.seleniumhq.org/).

The following recipes are available for configuring Internet Explorer:

- **[enhanced_security_configuration](https://github.com/dhoer/chef-ie#enhanced_security_configuration)** -
Enable/Disable IE Enhanced Security Configuration (IE ESC)
- **[feature_bfcache](https://github.com/dhoer/chef-ie#feature_bfcache)** - Enable/Disable IE Feature Back-Forward
Cache
- **[security_zones](https://github.com/dhoer/chef-ie#security_zones)** - Configure IE Security Zones Policies;
Local Home, Internet, Local Internet, Trusted Sites, and Restricted Sites

A `ie_version` method is also available to retrieve the exact version of Internet Explorer installed.

Tested against IE 11 on Windows Server 2012 R2.

## Requirements

- Chef 11.6.0 or higher (includes a built-in registry_key resource)

## Platforms

- Windows

## Usage

Add `ie` as a dependency to make method `ie_version` available for use.

Retrieve current version installed:

```ruby
v = ie_version
```

## Recipes


### enhanced_security_configuration

Enable/Disable Internet Explorer Enhanced Security Configuration (IE ESC).

Note this sets HKEY_CURRENT_USER keys, so it configures only the user that the chef-client runs as.

#### Attributes

- `node['ie']['enhanced_security_configuration']` - Defaults to `true`


### feature_bfcache

Enable/Disable IE Feature Back-Forward Cache.  Allows drivers to maintain a connection to IE.

#### Attributes

- `node['ie']['feature_bfcache']` - Defaults to `false`


### security_zones

Configure IE Security Zones Policies (REG_DWORD types only); Local Home, Internet, Local Internet, Trusted Sites, and
Restricted Sites. See Zones section in http://support.microsoft.com/kb/182569 for a complete listing of security zone
settings.

A setting of zero sets a specific action as permitted, a setting of one causes a prompt to appear, and a setting
of three prohibits the specific action.

Note this sets HKEY_CURRENT_USER keys, so it configures only the user that the chef-client runs as.

#### Attributes

- `node['ie']['zone']['local_home']` - Configure local home zone.  Defaults to `{}`.
- `node['ie']['zone']['internet']` - Configure internet zone.  Defaults to `2500` (Enable Protected Mode).
- `node['ie']['zone']['local_internet']` - Configure local internet zone. Defaults `2500` (Enable Protected Mode).
- `node['ie']['zone']['trusted_sites']` - Configure trusted sites zone. Defaults to `2500` (Enable Protected Mode).
- `node['ie']['zone']['restricted_sites']` - Configure restricted sites zone. Defaults to `2500` (Enable Protected
Mode).

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-ie).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-ie/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-ie/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-ie/blob/master/LICENSE.md) file for details.
