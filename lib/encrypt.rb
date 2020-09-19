require_relative "enigma"

enigma = Enigma.new

message = ARGV[0]
encryption = ARGV[1]
file = File.open("#{message}", 'r')
message = file.readlines

encrypt_info = enigma.encrypt(message[0].chomp)

encrypt = File.open(encryption, "w")
encrypt.write(encrypt_info[:encryption])
encrypt.close


puts "Created #{encryption} with the key #{encrypt_info[:key]} and date #{encrypt_info[:date]}"
