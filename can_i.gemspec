require File.expand_path('../lib/can_i/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'can_i'
  s.version       = CanI::Version
  s.authors       = ["Matt Brewer"]
  s.email         = 'matt.brewer@me.com'

  s.summary       = "Provides an easy way to define roles for performing actions in your RubyMotion app."
  s.description   = "Authorization DSL for querying if a user can or cannot perform an action in your application."
  s.homepage      = "https://github.com/macfanatic/can_i"
  s.license       = "MIT"

  s.files         = Dir["lib/**/*"] + ["README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ['lib']

  s.add_dependency "bubble-wrap"

  s.add_development_dependency "rake"
  s.add_development_dependency "motion-stump"

end
