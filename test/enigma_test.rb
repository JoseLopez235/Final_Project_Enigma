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

    expected =  {
      encryption: "pib wdmczpu",
      key: "02715",
      date: "190920"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715")

    key = enigma.stubs(:rand).returns(4321)
    expected =  {
      encryption: "ryqfytaiaei",
      key: "04321",
      date: "190920"
    }
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_encrypt_letter_finder
    enigma = Enigma.new
    character = "h"
    shift = {A: 3}
    key_sym = :A
    assert_equal "k", enigma.encrypt_letter_finder(character, shift, key_sym)
    character = "!"
    shift = {A: 56}
    key_sym = :A
    assert_equal "!", enigma.encrypt_letter_finder(character, shift, key_sym)
    character = "e"
    shift = {A: 27}
    key_sym = :A
    assert_equal "e", enigma.encrypt_letter_finder(character, shift, key_sym)
  end

  def test_encrypted_hash_maker
    enigma = Enigma.new
    expected =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.hash_maker("keder ohulw", "02715", "040895", "encryption")
  end

  def test_decrypt_letter_finder
    enigma = Enigma.new
    character = "h"
    shift = {A: 3}
    key_sym = :A
    assert_equal "e", enigma.decrypt_letter_finder(character, shift, key_sym)
    character = "!"
    shift = {A: 56}
    key_sym = :A
    assert_equal "!", enigma.decrypt_letter_finder(character, shift, key_sym)
    character = "e"
    shift = {A: 27}
    key_sym = :A
    assert_equal "e", enigma.decrypt_letter_finder(character, shift, key_sym)
  end

  def test_decrypted_hash_maker
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.hash_maker("hello world", "02715", "040895", "decryption")
  end

  def test_should_decrypt_message
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")

    expected =  {
      decryption: " avxgwf jhn",
      key: "02715",
      date: "190920"
    }
    assert_equal expected, enigma.decrypt("hello world", "02715")
  end
end
