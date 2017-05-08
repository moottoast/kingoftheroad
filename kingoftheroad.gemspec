# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kingoftheroad/version'

Gem::Specification.new do |spec|
  spec.name          = "kingoftheroad"
  spec.license       = ""
  spec.version       = Kingoftheroad::VERSION
  spec.authors       = ["Jeff Juszczak"]
  spec.email         = ["jeff@moottoast.com"]

  spec.summary       = %q{Easily import records into Route 53.}
  spec.description   = %q{Import DNS records from a zone file and import them into AWS Route 53.}
  spec.homepage      = "https://github.com/moottoast/kingoftheroad"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.5')
  spec.add_development_dependency('test-unit')
  spec.add_dependency('aws-sdk', '~> 2')
  spec.add_development_dependency('byebug')
end
