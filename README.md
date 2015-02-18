# IE Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/ie.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-ie.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-ie.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/ie
[travis]: https://travis-ci.org/dhoer/chef-ie
[github]: https://github.com/dhoer/chef-ie/issues

Configures Internet Explorer to aid tools like [Selenium](http://www.seleniumhq.org/).
The attribute defaults in this cookbook should always default to the most secure settings by convention.

Selenium requires protected mode in Internet Explorer to be set the same across
[zones](http://jimevansmusic.blogspot.in/2012/08/youre-doing-it-wrong-protected-mode-and.html).
This cookbooks enables protected mode across all zones by default.

A `ie_version` method is also available to retrieve the exact version of Internet Explorer installed.

## Requirements

- Chef 11

## Platforms

- Windows

## Usage

Just include `recipe[ie]` in your run_list to configure Internet Explorer.


The following example retrieves the version installed by using `ie_version` method:

```ruby
v = ie_version
```

## Attributes

- `node['ie']['enable_protected_mode']['internet']` - Enable protected mode for internet zone.  Defaults to `true`.
- `node['ie']['enable_protected_mode']['local_internet']` - Enable protected mode for local internet zone.
Defaults to `true`.
- `node['ie']['enable_protected_mode']['trusted_sites']` - Enable protected mode for trusted sites zone.
Defaults to `true`.
- `node['ie']['enable_protected_mode']['restricted_sites']` - Enable protected mode for restricted sites zone.
Defaults to `true`.


## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-ie).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-ie/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-ie/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-ie/blob/master/LICENSE.md) file for details.
