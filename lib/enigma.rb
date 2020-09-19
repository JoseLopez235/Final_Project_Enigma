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

  def keys_code(key)

  end

  def encrypt(message, key=key_generator, date=date_generator)

  end
end
