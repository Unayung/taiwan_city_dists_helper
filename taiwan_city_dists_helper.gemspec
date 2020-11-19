# frozen_string_literal: true

# gemspec
lib = File.expand_path('/lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taiwan_city_dists_helper/version'

Gem::Specification.new do |gem|
  gem.name          = 'taiwan_city_dists_helper'
  gem.version       = TaiwanCityDistsHelper::Rails::VERSION
  gem.required_ruby_version = '>= 2.5.7'
  gem.authors       = 'unayung'
  gem.email         = 'Unayung@gmail.com'
  gem.description   = 'Generate Taiwan cities and dists model and provide dynamic select box helper'
  gem.summary       = 'This gem is a test'
  gem.homepage      = 'http://github.com/Unayung/taiwan_city_dists_helper'

  gem.add_dependency 'nokogiri'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
