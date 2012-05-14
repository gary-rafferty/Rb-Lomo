# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rb-lomo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gary Rafferty"]
  gem.email         = ["gary.rafferty@gmail.com"]
  gem.description   = %q{Ruby library for the Lomography API}
  gem.summary       = %q{This gem covers most of the functionality from the Lomography API}
  gem.homepage      = "https://github.com/gary-rafferty/Rb-Lomo"

  gem.add_dependency 'rest-client'
  gem.add_dependency 'json'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rb-lomo"
  gem.require_paths = ["lib"]
  gem.version       = Rb::Lomo::VERSION
end
