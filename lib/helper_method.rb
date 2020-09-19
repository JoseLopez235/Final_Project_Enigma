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

  def encrypted_hash_maker(message, key, date)
    encrypted_hash = {}
    encrypted_hash[:encryption] = message
    encrypted_hash[:key] = key
    encrypted_hash[:date] = date
    encrypted_hash
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
end
