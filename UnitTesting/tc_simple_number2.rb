# File:  tc_simple_number2.rb

require_relative "simple_number"
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase

  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2) )
    assert_equal(4, SimpleNumber.new(2).multiply(2) )
  end

  def test_typecheck
    assert_raise( RuntimeError ) { SimpleNumber.new('a') }
  end

  def test_failure
    assert_not_equal(3, SimpleNumber.new(2).add(2), "Adding doesn't work" )
  end

  def test_operations
    assert_equal(5, SimpleNumber.new(3).add(2) )
    assert_equal(6, SimpleNumber.new(2).multiply(3) )
    assert_equal(-1, SimpleNumber.new(2).substract(3) )
    assert_equal(2, SimpleNumber.new(6).divide(3) )
  end

end
