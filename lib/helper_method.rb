module HelperMethod

  def hash_maker(message, key, date, cipher)
    hash = {}
    hash["#{cipher}".to_sym] = message
    hash[:key] = key
    hash[:date] = date
    hash
  end

  def letter_finder(character, shift, key_sym, cipher)
    if @alphabet.include?(character)
      if shift[key_sym] == 27
        character
      else
        index = @alphabet.find_index(character)
        letter_shift = @alphabet[(index + shift[key_sym]) % 27] if cipher == "encryption"
        letter_shift = @alphabet[(index - shift[key_sym]) % 27] if cipher == "decryption"
        letter_shift
      end
    else
      character
    end
  end
end
