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
                                # => Format: "国家\t省份或直辖市\t地区或城市"

IPIP.find('127.0.0.1')          # => "本机地址\t本机地址\t\t"

IPIP.find('211.147.4.49')       # => "中国\t北京\t北京\t"

IPIP.find('202.195.161.30')     # => "中国\t江苏\t镇江\t"

IPIP.find('www.douban.com')     # => "中国\t北京\t北京\t"

```

If you have `DATX` file(付费用户):

```
require 'ipip'

IPIPX.load_data!("/path/ipip.datx")

# => Format: "国家\t省份或直辖市\t地区或城市\t学校或单位\t运营商\t纬度\t经度\t时区1\t时区2\t行政代码.."

IPIPX.find('118.28.8.8')        # => "中国\t天津\t天津\t\t鹏博士\t39.125596\t117.190182\tAsia/Shanghai\tUTC+8\t120000\t86\tCN\tAP"

IPIPX.find("58.82.112.15")      # => "中国\t广东\t广州\t\t电信\t23.125178\t113.280637\tAsia/Shanghai\tUTC+8\t440100\t86\tCN\tAP"

IPIPX.find("60.191.8.80")       # => "中国\t浙江\t杭州\t\t电信\t30.287459\t120.153576\tAsia/Shanghai\tUTC+8\t330100\t86\tCN\tAP"

IPIPX.find("114.114.114.114")   # => "114DNS\t114DNS\t\tgreatbit.com\t\t\t\t\t\t\t\t*\t*"

```

You can try running `ipip [ip | domain]`:

```
$ ipip 202.195.161.30
Location for 202.195.161.30: 中国       江苏    镇江

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
