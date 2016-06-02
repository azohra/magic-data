# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'magic_data'
  spec.version       = '1.0.5'
  spec.authors       = ['Justin Commu']
  spec.email         = ['Justin.Commu@loblaw.ca']
  spec.summary       = 'Dynamic data library for Ruby.'
  spec.description   = 'magic_data allows a user to setup dynamic keys at runtime and lets them retrieve the most recently generated value'
  spec.homepage      = 'https://loblawdigital.ca'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.platform      = Gem::Platform::RUBY
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']


  spec.add_runtime_dependency 'magic_logger', '>= 0.0.1'
end
