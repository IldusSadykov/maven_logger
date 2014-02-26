module MavenLogger
  module Redefiner
    def self.redefine_instance_method(mixer_class, method_name)
      original_method = "#{method_name}_original"

      mixer_class.class_eval do
        alias_method original_method, method_name

        send :define_method, method_name do |*args|
          result = send(original_method, *args)
          MavenLogger::Redefiner.create_log_entry(
            mixer_class,
            method_name,
            result
          )
          result
        end
      end
    end

    def self.redefine_class_method(mixer_class, method_name)
      name = "#{name}_original"

      mixer_class.instance_eval do
        mixer_class.singleton_class.send(:alias_method, name, method_name)

        mixer_class.singleton_class.send :define_method, method_name do |*args|
          result = send(name.to_s, *args)
          MavenLogger::Redefiner.create_log_entry(
            mixer_class,
            method_name,
            result
          )
          result
        end
      end
    end

    def self.create_log_entry(mixer_class, method_name, result)
      if mixer_class.respond_to?(:id)
        object_id = mixer_class.id
      else
        object_id = mixer_class.object_id
      end

      log_name = mixer_class.to_s.demodulize.underscore

      log_info = {
        object_type: mixer_class.to_s,
        object_id:   object_id,
        action_type: method_name.to_s,
        description: I18n.t("maven_logger.#{log_name}.#{method_name}"),
        result:      result
      }

      if MavenLogger.empty_log
        LoggerEntry.create(log_info)
      else result && result.count > 0
        LoggerEntry.create(log_info)
      end
    end
  end
end
