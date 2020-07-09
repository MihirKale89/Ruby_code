require_relative "time_processor"
require "test/unit"

class TestTimeProcessor < Test::Unit::TestCase

  def test_morning_hours
    assert_equal("9:23 AM", TimeProcessor.add_minutes("9:13 AM", 10))
    assert_equal("10:03 AM", TimeProcessor.add_minutes("10:13 AM", -10))
  end

  def test_evening_hours
    assert_equal("6:23 PM", TimeProcessor.add_minutes("6:13 PM", 10))
    assert_equal("7:03 PM", TimeProcessor.add_minutes("7:13 PM", -10))
  end

  def test_noon_hours
    assert_equal("12:10 PM", TimeProcessor.add_minutes("11:55 AM", 15))
    assert_equal("12:00 PM", TimeProcessor.add_minutes("11:55 AM", 5))
    assert_equal("12:00 PM", TimeProcessor.add_minutes("12:05 PM", -5))
    assert_equal("11:55 AM", TimeProcessor.add_minutes("12:10 PM", -15))
  end

  def test_midnight_hours
    assert_equal("12:10 AM", TimeProcessor.add_minutes("11:55 PM", 15))
    assert_equal("12:00 AM", TimeProcessor.add_minutes("11:55 PM", 5))
    assert_equal("12:00 AM", TimeProcessor.add_minutes("12:05 AM", -5))
    assert_equal("11:55 PM", TimeProcessor.add_minutes("12:10 AM", -15))
  end

  def test_across_days
    assert_equal("7:06 AM", TimeProcessor.add_minutes("7:05 AM", 1441))
    assert_equal("7:04 AM", TimeProcessor.add_minutes("7:05 AM", -1441))
  end

end
