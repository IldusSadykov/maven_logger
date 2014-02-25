class LoggerSchema < MavenLogger::Schema
  # add some schema for classes
  # add_schema_for SomeClass, :some_action, :some_method

  private

  # WARNING: These methods should be whitelisted in RBP

  #def self.some_method(result)
  #  { some_info: result }
  #end
end
