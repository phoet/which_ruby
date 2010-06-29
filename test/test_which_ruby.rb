require 'test_helper'

class TestWhichRuby < Test::Unit::TestCase
  
  def setup
    @helper = Object.new
    @helper.extend WhichRuby
  end
  
  def test_r_type_from_engine
    @helper.stubs(:ruby_engine).returns("jruby")
    
    assert_equal(:jruby, @helper.ruby_type)
    assert_equal(:jruby, @helper.rt)
  end
  
  def test_r_type_from_description
    @helper.stubs(:ruby_engine).returns(nil)
    @helper.stubs(:ruby_description).returns("ruby 1.8.7 (2010-04-19 patchlevel 253) [i686-darwin10.4.0], MBARI 0x6770, Ruby Enterprise Edition 2010.02")
    
    assert_equal(:ruby, @helper.ruby_type)
  end
  
  def test_r_type
    assert_equal(:ruby, @helper.ruby_type)
  end
  
  def test_which_r?
    assert_equal(true, @helper.is_ruby_type?(:ruby))
    assert_equal(true, @helper.r?(:ruby))
  end
  
  def test_which_r_with_mapping?
    @helper.stubs(:ruby_engine).returns("rbx")
    assert_equal(true, @helper.r?(:rubinius))
  end
  
  def test_respond_to?
    @helper.stubs(:ruby_engine).returns("jruby")
    assert_equal(true, @helper.respond_to?(:jruby?))
  end
  
  def test_jruby?
    @helper.stubs(:ruby_engine).returns("jruby")
    assert_equal(true, @helper.jruby?)
  end
  
  def test_ruby_scope
    @helper.stubs(:ruby_engine).returns("jruby")
    assert_equal("foo", @helper.ruby_scope(:jruby){"foo"})
    assert_equal(nil, @helper.ruby_scope(:ree){"foo"})
  end
end