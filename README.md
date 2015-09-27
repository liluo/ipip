# IPIP

[![Gem Version](https://badge.fury.io/rb/ipip.svg)](http://badge.fury.io/rb/ipip)
[![Build Status](https://travis-ci.org/liluo/ipip.svg?branch=master)](https://travis-ci.org/liluo/ipip)

IP search based on [IPIP.net](http://ipip.net/)

### Getting Started

Install the gem:

```
gem install ipip
```

Then use it in your application:

```
require 'ipip'

                                # => Format: "国家\t省份或直辖市\t地区或城市\t学校或单位"

IPIP.find('127.0.0.1')          # => "本机地址\t本机地址\t\t"

IPIP.find('211.147.4.49')       # => "中国\t北京\t北京\t"

IPIP.find('202.195.161.30')     # => "中国\t江苏\t镇江\t江苏大学"

IPIP.find('www.douban.com')     # => "中国\t北京\t北京\t"
```

You can try running `ipip [ip | domain]`:

```
$ ipip 202.195.161.30
Location for 202.195.161.30: 中国       江苏    镇江    江苏大学

$ ipip douban.com
Location for douban.com: 中国   北京    北京
```

### Contributing

* Fork the repository.
* Create a topic branch.
* Implement your feature or bug fix.
* Add, commit, and push your changes.
* Submit a pull request.

### ChangeLog

[ChangeLog](CHANGES.md)

### License

Released under the [MIT license](LICENSE).
