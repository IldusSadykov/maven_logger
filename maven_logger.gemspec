$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "maven_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "maven_logger"
  s.version     = MavenLogger::VERSION
  s.authors     = ["Ildus Sadykov"]
  s.email       = ["ildus.sadykov@flatstack.com"]
  s.homepage    = ""
  s.summary     = "MavenLogger"
  s.description = "MavenLogger for log actions"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'mongoid'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails', '~>4.2.0'
  s.add_development_dependency 'mongoid-rspec', '1.7.0'
  s.add_development_dependency 'database_cleaner'
end
