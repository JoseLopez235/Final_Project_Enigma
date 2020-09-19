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
    shift = Shift.new
    Date.stubs(:today).returns(Date.new(2020,9,18))
    assert_equal "180920", shift.date_generator
  end

  def test_returns_hash_with_keys
    shift = Shift.new
    expected = {
      a_key: "02",
      b_key: "27",
      c_key: "71",
      d_key: "15"
    }
    assert_equal expected, shift.key_codes("02715")
  end

  def test_returns_hash_with_offset_keys
    shift = Shift.new
    expected = {
      a_offset: "1",
      b_offset: "0",
      c_offset: "2",
      d_offset: "5"
    }
    assert_equal expected, shift.key_offsets("040895")
  end

  def test_final_shift
    shift = Shift.new
    key = shift.key_codes("02715")
    offset = shift.key_offsets("040895")
    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal expected, shift.final_shift(key, offset)
  end
end
