def caesar_cipher(text, shift)
  alphabet = ("a".."z").to_a
  encryption_alphabet = alphabet.rotate(shift)

  text.downcase.tr(alphabet.join, encryption_alphabet.join)
end

def caesar_cipher2(text, shift)
  text.downcase.tr(("a".."z").to_a.join, ("a".."z").to_a.rotate(shift).join)
end

def caesar_cipher3(text, shift)
  alphabet = ("a".."z").to_a
  encryption_alphabet = alphabet.rotate(shift)
  encrypted_text = ""

  text.each_char do |letter|
    index = alphabet.index(letter)
    if !index.nil?
      encrypted_text += encryption_alphabet[index]
    else
      encrypted_text += letter
    end
  end
  encrypted_text
end


puts caesar_cipher("hello, there 123", 101)

puts caesar_cipher2("hello, there 123", 101)

puts caesar_cipher3("hello, there 123", 101)
