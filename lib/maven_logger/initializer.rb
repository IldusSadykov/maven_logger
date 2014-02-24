module MavenLogger
  class Initializer
    def self.configure(&block)
      yield(new)
    end

    def log_class(klass, &block)
      klass.extend(MavenLogger::Action)
      yield(klass)
    end
  end
end
