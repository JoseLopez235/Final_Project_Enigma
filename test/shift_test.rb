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
end
