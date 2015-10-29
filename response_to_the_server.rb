require './interact_server.rb'

resource_name = "http://localhost:4567/"
word_path = "word"
answer_path = "answer?answer="

puts "This program is connect to the server: #{resource_name}, the String Encoder Game Server (by Codescrum)."
puts "\n"
puts "You ask the server for a word, thereby:"
url_to_get_word = resource_name+word_path
puts "Use this url = #{url_to_get_word}"
puts "\n"
url_to_send_answer = resource_name+answer_path
puts "You can solve the challenge employed this url = #{url_to_send_answer}<put_the_decoded_word_here>"
puts "\n"

interactor = InteractServer.new

challenges = [1,2,3,4]

challenges.each do |challenge|
  puts "The challenge #{challenge} is:"
  word = interactor.call_to_the_url(url_to_get_word)
  case challenge
  when 1
    decoded_word = word
  when 2
    decoded_word = word.reverse
  when 3
    decoded_word = word.gsub(/[13406]/, '1' => 'i', '3' => 'e', '4' => 'a', '0' => 'o', '6' => 'u')
    # binding.pry
  when 4
    word_to_char = word.chars
    word_length = word.length
    a = word_to_char[word_length-3..word_length]
    b = word_to_char[0..word_length-4]
    z = a << b
    decoded_word = z.join
  when 5
    # create this code
    # number_of_asterisks = word.count('*')
    # a = 'aeiou'.chars

    # word.sub('*', a.sample(1).join).sub('*', a.sample(1).join).sub('*', a.sample(1).join).sub('*', a.sample(1).join).sub('*', a.sample(1).join)
  else
    puts "no challenge configured"
  end
  puts "#{word} => #{decoded_word}"
  response = interactor.call_to_the_url(url_to_send_answer, decoded_word)
  puts "#{response}"
end












