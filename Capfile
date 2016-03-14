# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/passenger'
require "whenever/capistrano"

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
Rake::Task[:production].invoke