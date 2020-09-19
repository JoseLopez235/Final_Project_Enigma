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
      message << encrypt_letter_finder(character, shift, key_sym)
      index += 1
    end
    encrypted_hash_maker(message, key, date)
  end

  def decrypted_hash_maker(message, key, date)
    decrypted_hash = {}
    decrypted_hash[:decryption] = message
    decrypted_hash[:key] = key
    decrypted_hash[:date] = date
    decrypted_hash
  end

  def decrypt(message, key, date=date_generator)
    shift = final_shift(key_codes(key), key_offsets(date))
    keys = ["A", "B", "C", "D"]
    index = 0
    message = message.downcase.chars.each_with_object("") do |character, message|
      index = 0 if index > 3
      key_sym = keys[index].to_sym
      message << decrypt_letter_finder(character, shift, key_sym)
      index += 1
    end
    decrypted_hash_maker(message, key, date)
  end
end
