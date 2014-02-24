module MavenLogger
  class Engine < ::Rails::Engine
    #isolate_namespace MavenLogger
    config.maven_logger = MavenLogger

    initializer 'maven_logger.logger_configure' do
      Initializer.configure do |config|
        MavenLogger.class_actions.each do |class_name, actions|
          config.log_class class_name do |klass|
            klass.add_action actions
          end
        end
      end
    end
  end
end
