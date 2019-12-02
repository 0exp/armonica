# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/armonica/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.4.9'

  spec.name    = 'armonica'
  spec.version = Armonica::VERSION
  spec.authors = ['Rustam Ibragimov']
  spec.email   = ['iamdaiver@gmail.com']

  spec.summary     = 'A set of commonly used data structures powered by Sorbet'
  spec.description = 'A set of commonly used data structures powered by Sorbet'
  spec.homepage    = 'https://github.com/0exp/armonica'
  spec.license     = 'MIT'

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_dependency 'sorbet-runtime'

  spec.add_development_dependency 'sorbet'
  spec.add_development_dependency 'armitage-rubocop', '~> 0.77'
  spec.add_development_dependency 'rspec',            '~> 3.9'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
