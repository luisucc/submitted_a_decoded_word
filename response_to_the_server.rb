require './interact_server.rb'

resource_name = "http://localhost:4567/"
word_path = "word"
answer_path = "answer?answer="

puts "This program is connect to the server: #{resource_name}, the String Encoder Game Server (by Codescrum)."
puts "\n"
puts "You ask the server for a word, thereby:"
word_url = resource_name+word_path
puts "Use this url = #{word_url}"
puts "\n"
answer_url = resource_name+answer_path
puts "You can solve the challenge employed this url = #{answer_url}<put_the_decoded_word_here>"

puts "\n"

objet_interaction = InteractServer.new

# 1
word = objet_interaction.get_word(word_url)

puts "Challenge one: by decoded the word = #{word}"

puts "Is solved?: #{objet_interaction.send_word(answer_url, word)}"

# 2
word = objet_interaction.get_word(word_url)

puts "Challenge two: by decoded the word = #{word}"

decoding_word = word.reverse

puts "Is solved?: #{objet_interaction.send_word(answer_url, decoding_word)}"

# 3
word = objet_interaction.get_word(word_url)

puts "Challenge three: by decoded the word = #{word}"

decoding_word = word.gsub(/[13406]/, '1' => 'i', '3' => 'e', '4' => 'a', '0' => 'o', '6' => 'u')

puts "Is solved?: #{objet_interaction.send_word(answer_url, decoding_word)}"

# 4
word = objet_interaction.get_word(word_url)

puts "Challenge fourth: by decoded the word = #{word}"

word_to_char = word.chars

word_length = word.length

a = word_to_char[word_length-3..word_length]

b = word_to_char[0..word_length-4]

z = a << b

decoding_word = z.join

puts "Is solved?: #{objet_interaction.send_word(answer_url, decoding_word)}"

