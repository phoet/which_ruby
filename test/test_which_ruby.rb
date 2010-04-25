require 'test_helper'

class TestWhichRuby < Test::Unit::TestCase
  
  def setup
    @helper = Object.new
    @helper.extend WhichRuby
  end
  
  def test_r_type_from_engine
    @helper.stubs(:engine).returns("jruby")
    
    assert_equal(:jruby, @helper.ruby_type)
    assert_equal(:jruby, @helper.rt)
  end
  
  def test_r_type_from_description
    @helper.stubs(:engine).returns(nil)
    @helper.stubs(:description).returns("ruby 1.8.7 (2010-01-10 patchlevel 249) [i686-darwin10.2.0]")
    
    assert_equal(:ruby, @helper.ruby_type)
  end
  
  def test_r_type
    assert_equal(:ruby, @helper.ruby_type)
  end
  
  def test_which_r?
    assert_equal(true, @helper.is_ruby_type?(:ruby))
    assert_equal(true, @helper.r?(:ruby))
  end
end