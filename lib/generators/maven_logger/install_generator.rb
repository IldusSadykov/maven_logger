require 'rails/generators/base'
require 'securerandom'

module MavenLogger
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a MavenLogger initializer and copy locale files to your application.'

      def copy_initializer
        template 'maven_logger.rb', 'config/initializers/maven_logger.rb'
      end

      def copy_locale
        copy_file '../../../config/locales/en.yml', 'config/locales/maven_logger.en.yml'
      end

      def copy_models
        copy_file 'logger_entry.rb', 'app/models/logger_entry.rb'
        copy_file 'logger_schema.rb', 'app/models/logger_schema.rb'
      end
    end
  end
end
