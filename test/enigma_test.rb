require_relative "test_helper"
require 'date'

class EnigmaTest < Minitest::Test
  def test_should_exist
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_should_return_encrypted_message
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
    date = Date.today
    date = date.strftime("%d%m%y")
    assert_equal date, enigma.date_generator
  end
end
