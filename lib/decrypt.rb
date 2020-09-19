require_relative "enigma"

enigma = Enigma.new

message = ARGV[0]
decryption = ARGV[1]
key = ARGV[2]
date = ARGV[3]

file = File.open("#{message}", 'r')
message = file.readlines

decrypt_info = enigma.decrypt(message[0].chomp, key, date)

encrypt = File.open(decryption, "w")
encrypt.write(decrypt_info[:decryption])
encrypt.close

puts "Created #{decryption} with the key #{decrypt_info[:key]} and date #{decrypt_info[:date]}"
