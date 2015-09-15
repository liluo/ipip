require File.expand_path('../lib/ipip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'ipip'
  gem.authors       = 'liluo'
  gem.email         = 'i@liluo.org'
  gem.homepage      = 'https://github.com/liluo/ipip'
  gem.license       = 'MIT'
  gem.version       = IPIP::VERSION
  gem.description   = %q{ IP search based on ipip.net }
  gem.summary       = %q{ IP search based on ipip.net }

  gem.files         = Dir['lib/**/*']
end
