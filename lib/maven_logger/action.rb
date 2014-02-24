module MavenLogger
  module Action
    def add_action(logged_methods)
      logged_methods.each do |method_name|
        if instance_methods.include?(method_name)
          Redefiner.redefine_instance_method(
            self,
            method_name
          )
        else
          Redefiner.redefine_class_method(
            self,
            method_name
          )
        end
      end
    end
  end
end
