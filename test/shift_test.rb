class ShiftTest < Minitest::Test
  def test_should_exist
    shift = Shift.new
    assert_instance_of Shift, shift
  end
end
