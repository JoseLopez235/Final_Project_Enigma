class Shift
  def key_generator
    key = rand(1000..9999)
    key = "0" + key.to_s
  end
end
