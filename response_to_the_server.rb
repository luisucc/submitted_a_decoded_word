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

word = objet_interaction.get_word(word_url)

puts "Challenge one: by decoded the word = #{word}"

puts "Is solved?: #{objet_interaction.send_word(answer_url, word)}"

word = objet_interaction.get_word(word_url)

puts "Challenge two: by decoded the word = #{word}"

decoding_word = word.reverse

puts "Is solved?: #{objet_interaction.send_word(answer_url, decoding_word)}"

word = objet_interaction.get_word(word_url)

puts "Challenge three: by decoded the word = #{word}"

decoding_word = word.gsub(/[13406]/, '1' => 'i', '3' => 'e', '4' => 'a', '0' => 'o', '6' => 'u')

puts "Is solved?: #{objet_interaction.send_word(answer_url, decoding_word)}"
