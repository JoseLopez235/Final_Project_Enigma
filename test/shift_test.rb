require_relative 'test_helper'

class ShiftTest < Minitest::Test
  def test_should_exist
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_should_return_random_key
    shift = Shift.new
    shift.stubs(:rand).returns(4321)
    assert_equal "04321", shift.key_generator
  end

  def test_should_return_today_date
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020,9,18))
    assert_equal "180920", enigma.date_generator
  end
end
