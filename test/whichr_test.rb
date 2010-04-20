require 'test_helper'

class WichrTest < Test::Unit::TestCase
  
  def setup
    @helper = Object.new
    @helper.extend Whichr
  end
  
  def test_type_from_engine
    @helper.stubs(:engine).returns("jruby")
    
    assert_equal(:jruby, @helper.type)
  end
  
  def test_type_from_description
    @helper.stubs(:engine).returns(nil)
    @helper.stubs(:description).returns("ruby 1.8.7 (2010-01-10 patchlevel 249) [i686-darwin10.2.0]")
    
    assert_equal(:ruby, @helper.type)
  end
  
  def test_type
    assert_equal(:ruby, @helper.type)
  end
  
  def test_which?
    assert_equal(true, @helper.which?(:ruby))
  end
end