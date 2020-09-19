require 'date'

class Enigma
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def key_generator
    key = rand(1000..9999)
    key = "0" + key.to_s
  end

  def date_generator
    date = Date.today
    date = date.strftime("%d%m%y")
  end

  def key_codes(key)
    key_hash = {}
    key_hash[:a_key] = key[0]+key[1]
    key_hash[:b_key] = key[1]+key[2]
    key_hash[:c_key] = key[2]+key[3]
    key_hash[:d_key] = key[3]+key[4]
    key_hash
  end

  def key_offsets(date)
    offset_hash = {}
    key = (date.to_i ** 2).to_s.chars.pop(4)
    offset_hash[:a_offset] = key[0]
    offset_hash[:b_offset] = key[1]
    offset_hash[:c_offset] = key[2]
    offset_hash[:d_offset] = key[3]
    offset_hash
  end

  def final_shift(key_hash, offset_hash)
    final_shift = {}
    final_shift[:A] = key_hash[:a_key].to_i+offset_hash[:a_offset].to_i
    final_shift[:B] = key_hash[:b_key].to_i+offset_hash[:b_offset].to_i
    final_shift[:C] = key_hash[:c_key].to_i+offset_hash[:c_offset].to_i
    final_shift[:D] = key_hash[:d_key].to_i+offset_hash[:d_offset].to_i
    final_shift
  end

  def letter_finder(character, shift, key_sym)
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
      message << letter_finder(character, shift, key_sym)
      index += 1
    end
    encrypted_hash_maker(message, key, date)
  end
end
