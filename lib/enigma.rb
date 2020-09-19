require 'date'
require_relative 'shift'
require_relative 'helper_method'

class Enigma < Shift
  include HelperMethod
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key=key_generator, date=date_generator)
    shift = final_shift(key_codes(key), key_offsets(date))
    keys = ["A", "B", "C", "D"]
    index = 0
    message = message.downcase.chars.each_with_object("") do |character, message|
      index = 0 if index > 3
      key_sym = keys[index].to_sym
      message << letter_finder(character, shift, key_sym, "encryption")
      index += 1
    end
    hash_maker(message, key, date, "encryption")
  end

  def decrypt(message, key, date=date_generator)
    shift = final_shift(key_codes(key), key_offsets(date))
    keys = ["A", "B", "C", "D"]
    index = 0
    message = message.downcase.chars.each_with_object("") do |character, message|
      index = 0 if index > 3
      key_sym = keys[index].to_sym
      message << letter_finder(character, shift, key_sym, "decryption")
      index += 1
    end
    hash_maker(message, key, date, "decryption")
  end
end
