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
    message = cipher_message(message, shift, "encryption")
    hash_maker(message, key, date, "encryption")
  end

  def decrypt(message, key, date=date_generator)
    shift = final_shift(key_codes(key), key_offsets(date))
    message = cipher_message(message, shift, "decryption")
    hash_maker(message, key, date, "decryption")
  end
end
