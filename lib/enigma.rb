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

  def encrypt(message, key=key_generator, date=date_generator)

  end
end
