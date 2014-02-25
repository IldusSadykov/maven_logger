require 'spec_helper'

class LoggerTester
  def foo
    'Foo called'
  end

  def bar
    'Bar called'
  end

  def baz
    'Baz called'
  end
end

describe MavenLogger do
  before :all do
    LoggerTester.extend(MavenLogger::Action)
  end

  describe '.add_action(method_name: description)' do
    before :all do
      LoggerTester.add_action([:foo, :bar])
    end

    it 'creates alias methods' do
      LoggerTester.instance_methods.should include(:foo_original)
      LoggerTester.instance_methods.should include(:bar_original)
      LoggerTester.instance_methods.should_not include(:baz_original)
    end

    it 'saves log to database' do
      LoggerTester.new.foo

      LoggerEntry.last.should be
      LoggerEntry.last.object_type.should eq 'LoggerTester'
      LoggerEntry.last.action_type.should eq 'foo'
      LoggerEntry.last.description.should eq 'Foo called'
    end
  end
end
