require 'date'
require_relative 'shift'

class Enigma < Shift
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def final_shift(key_hash, offset_hash)
    final_shift = {}
    final_shift[:A] = key_hash[:a_key].to_i+offset_hash[:a_offset].to_i
    final_shift[:B] = key_hash[:b_key].to_i+offset_hash[:b_offset].to_i
    final_shift[:C] = key_hash[:c_key].to_i+offset_hash[:c_offset].to_i
    final_shift[:D] = key_hash[:d_key].to_i+offset_hash[:d_offset].to_i
    final_shift
  end

  def encrypt_letter_finder(character, shift, key_sym)
    if @alphabet.include?(character)
      if shift[key_sym] == 27
        character
      else
        letter_index = @alphabet.find_index(character)
        letter_shift = @alphabet[(letter_index + shift[key_sym]) % 27]
        letter_shift
      end
    else
      character
    end
  end

  def encrypted_hash_maker(message, key, date)
    encrypted_hash = {}
    encrypted_hash[:encryption] = message
    encrypted_hash[:key] = key
    encrypted_hash[:date] = date
    encrypted_hash
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

  def decrypt_letter_finder(character, shift, key_sym)
    if @alphabet.include?(character)
      if shift[key_sym] == 27
        character
      else
        letter_index = @alphabet.find_index(character)
        letter_shift = @alphabet[(letter_index - shift[key_sym]) % 27]
        letter_shift
      end
    else
      character
    end
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
