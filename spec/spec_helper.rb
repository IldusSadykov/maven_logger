ENV['RAILS_ENV'] ||= 'test'
require 'rails/mongoid'
require 'database_cleaner'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'mongoid-rspec'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
