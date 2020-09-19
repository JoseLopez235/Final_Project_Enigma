require_relative "test_helper"

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
    enigma.key_generator.stubs(:rand).returns(4321)
    assert_equal 4321, enigma.key_generator
  end
end
