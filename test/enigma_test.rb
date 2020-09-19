require_relative "test_helper"
require 'date'

class EnigmaTest < Minitest::Test
  def test_should_exist
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_should_return_encrypted_message
    skip
    enigma = Enigma.new
    expected =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_should_return_random_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(4321)
    assert_equal "04321", enigma.key_generator
  end

  def test_should_return_today_date
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(2020,9,18))
    assert_equal "180920", enigma.date_generator
  end

  def test_returns_hash_with_keys
    enigma = Enigma.new
    expected = {
      a_key: "02",
      b_key: "27",
      c_key: "71",
      d_key: "15"
    }
    assert_equal expected, enigma.key_codes("02715")
  end

  def test_returns_hash_with_offset_keys
    enigma = Enigma.new
    expected = {
      a_offset: "1",
      b_offset: "0",
      c_offset: "2",
      d_offset: "5"
    }
    assert_equal expected, enigma.key_offsets("040895")
  end

  def test_final_shift
    enigma = Enigma.new
    key = enigma.key_codes("02715")
    offset = enigma.key_offsets("040895")
    expected = {
      A: 3,
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal expected, enigma.final_shift(key, offset)
  end
end
