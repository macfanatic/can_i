require File.expand_path('../lib/can_i/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'can_i'
  s.version       = CanI::Version
  s.authors       = ["Matt Brewer"]
  s.email         = 'matt.brewer@me.com'

  s.summary       = "Provides an easy way to define roles for performing actions in your RubyMotion app."
  s.description   = "Provides an easy way to define roles for performing actions in your RubyMotion app."

  s.homepage      = "https://github.com/macfanatic/rubymotion_roles"
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ['lib']

  s.add_dependency "bubble-wrap"

end
