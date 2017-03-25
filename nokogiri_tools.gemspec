# encoding: UTF-8
# frozen_string_literal: true

require File.expand_path('../lib/nokogiri-tools/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'nokogiri-tools'
  s.version         = NokogiriTools::VERSION
  s.author          = 'Yaroslav Konoplov'
  s.email           = 'eahome00@gmail.com'
  s.summary         = 'Extends Nokogiri with useful methods.'
  s.description     = 'Extends Nokogiri with useful methods.'
  s.homepage        = 'https://github.com/yivo/nokogiri-tools'
  s.license         = 'MIT'

  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_dependency 'nokogiri'
  s.add_dependency 'unicode-tools', '~> 1.0'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'test-unit', '~> 3.2'
end
