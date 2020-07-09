# File:  time_processor.rb

require_relative "time_processor"
require "test/unit"

class TestTimeProcessor < Test::Unit::TestCase

  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2) )
    assert_equal(6, SimpleNumber.new(2).multiply(3) )
  end

end
