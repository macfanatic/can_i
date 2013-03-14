require "bundler/gem_tasks"

$:.unshift('/Library/RubyMotion/lib')
require 'motion/project'
require 'bundler'

Bundler.require

Dir[File.expand_path('../lib/**/*', __FILE__)].each { |f| require f }

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'CanI'
end
