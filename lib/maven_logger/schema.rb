module MavenLogger
  class Schema
    cattr_accessor :schema
    self.schema = {}

    def self.prepare(entry)
      class_name = entry.object_type.underscore.to_sym
      method_name = entry.action_type.to_sym

      send(schema[class_name][method_name], entry.result) if schema[class_name] && schema[class_name][method_name]
    end

    def self.add_schema_for(klass, method, handler)
      class_name = klass.name.underscore.to_sym
      schema[class_name] = {} unless schema[class_name]

      schema[class_name][method] = handler
    end
  end
end
