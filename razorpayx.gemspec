# frozen_string_literal: true

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.7'
  s.name        = 'razorpayx'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'RazorpayX is a Ruby client for RazorpayX API'
  s.description = 'Razorpayx is a wrapper around RazorpayX API to make it easy to use in Ruby applications. It provides a simple way to interact with RazorpayX API.'
  s.authors     = ['Mithlesh Kumar']
  s.email       = 'mk581999@gmail.com'
  s.files       = ['lib/razorpayx.rb']
  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'byebug', '~> 11.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 1.0'
  s.add_development_dependency 'simplecov', '~> 0.0'
  s.add_development_dependency 'webmock', '~> 3.0'
  s.add_dependency 'faraday', '~> 2.12'
end
