require 'digest/md5'

def make_word
  word = []
  letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  6.times do
    word << letters.sample
  end
  return word.join().to_s
end

def make_hash(word)
  Digest::MD5.hexdigest(word)
end

def brute_force(key)
  message = make_word
  coded_message = make_hash(message)

  if coded_message == key
    puts "The message is #{message}"
    return false
  end
end

while true
  brute_force('b354e9b8c7a5fb1e073670a28f957032')
end
