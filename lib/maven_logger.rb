require 'maven_logger/action'
require 'maven_logger/engine'
require 'maven_logger/initializer'
require 'maven_logger/redefiner'
require 'maven_logger/schema'

module MavenLogger
  mattr_accessor :class_actions

  def self.setup
    yield self
  end
end
