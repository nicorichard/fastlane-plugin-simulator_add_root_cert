# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/simulator_add_root_cert/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-simulator_add_root_cert'
  spec.version       = Fastlane::SimulatorAddRootCert::VERSION
  spec.author        = 'Nico Richard'
  spec.email         = 'nicolas.richard@skipthedishes.ca'

  spec.summary       = 'Add a root cert to your simulators with Fastlane'
  spec.homepage      = "https://github.com/CityTransit/fastlane-plugin-simulator_add_root_cert"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.176.0')
end
