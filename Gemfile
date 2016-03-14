source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
# Use pg as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug'
  gem "factory_girl_rails"
  gem 'ffaker'
end

group :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'shoulda-matchers'
end

group :development do
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rubocop', require: false
  gem 'capistrano'
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '~> 1.1'
end

gem 'listen', '~> 3.0.5'
gem 'active_model_serializers',
  git: 'git@github.com:rails-api/active_model_serializers.git',
  branch: '0-8-stable'
gem 'devise', git: 'git@github.com:plataformatec/devise.git'
gem 'kaminari'
gem 'delayed_job_active_record'
gem "figaro"
gem 'versionist'

# HTTP (The Gem! a.k.a. http.rb) - a fast Ruby HTTP client with a chainable API,
#  streaming support, and timeouts
gem "http"

# Converter:Gregorian to Hijri Date and vice versa
gem 'hijri2greg_date'

# Database based asynchronous priority queue system
# gem 'delayed_job_active_record'

# Cron jobs in Ruby
gem 'whenever', :require => false