# IE Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/ie.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-ie.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-ie.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/ie
[travis]: https://travis-ci.org/dhoer/chef-ie
[github]: https://github.com/dhoer/chef-ie/issues

Configures Internet Explorer to aid tools like [Selenium](http://www.seleniumhq.org/).

The following recipes are available for configuring Internet Explorer:

- enhanced_security_configuration - Enable/Disable IE Enhanced Security Configuration (IE ESC)
- feature_bfcache - Enable/Disable IE Feature Back-Forward Cache
- security_zones - Configure IE Local Home, Internet, Local Internet, Trusted Sites, and Restricted Sites
Security Zones Policies

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

#### Attributes
- `node['ie']['enhanced_security_configuration']` - Defaults to `true`


### feature_bfcache

Enable/Disable IE Feature Back-Forward Cache.  Allows drivers to maintain a connection to IE.

#### Attributes
- `node['ie']['feature_bfcache']` - Defaults to `false`


### security_zones

Configure IE Local Home, Internet, Local Internet, Trusted Sites, and Restricted Sites Security Zones Policies.
See Zones section in http://support.microsoft.com/kb/182569 for a complete listing of security zone settings.

A setting of zero sets a specific action as permitted, a setting of one causes a prompt to appear, and a setting
of three prohibits the specific action.

#### Attributes
- `node['ie']['zone']['local_home']` - Set security for local home zone.  Defaults to Enable Protected Mode.
- `node['ie']['zone']['internet']` - Set security for internet zone.  Defaults to Enable Protected Mode.
- `node['ie']['zone']['local_internet']` - Set security for local internet zone. Defaults to Enable Protected Mode.
- `node['ie']['zone']['trusted_sites']` - Set security for trusted sites zone. Defaults to Enable Protected Mode.
- `node['ie']['zone']['restricted_sites']` - Set security for restricted sites zone. Defaults to Enable Protected Mode.

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-ie).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-ie/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-ie/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-ie/blob/master/LICENSE.md) file for details.
