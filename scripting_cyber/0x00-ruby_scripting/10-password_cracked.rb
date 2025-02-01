require 'digest'

if ARGV.length != 2
    puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
else
    hashed_password = ARGV[0]
    dictionary_file = ARGV[1]
    File.foreach(dictionary_file) do |word|
        word = word.strip
        hash = Digest::SHA256.hexdigest(word)
        if hash == hashed_password
            puts "Password found: #{word}"
            return
        puts "Password not found in dictionary."
        end
    end
end
