module HelperMethod
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

  def hash_maker(message, key, date, symbol)
    hash = {}
    hash["#{symbol}".to_sym] = message
    hash[:key] = key
    hash[:date] = date
    hash
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
end
