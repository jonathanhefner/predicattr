# -*- encoding: utf-8 -*-
require File.expand_path('../lib/predicattr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jonathan Hefner"]
  gem.email         = ["jonathan.hefner@gmail.com"]
  gem.description   = %q{Predicate attribte builder}
  gem.summary       = %q{Adds inquirer-style predicates for any class.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "predicattr"
  gem.require_paths = ["lib"]
  gem.version       = Predicattr::VERSION
  
  gem.add_development_dependency "rspec"
end
