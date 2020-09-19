class Shift
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
end
