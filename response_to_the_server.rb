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

challenges = [1,2,3,4,5,7,8]

challenges.each do |challenge|
  word = interactor.call_to_the_url(url_to_get_word)

  if word == "YOU HAVE FINISHED!"
    puts "YOU HAVE FINISHED!"
    break
  end

  puts "The challenge #{challenge} is:"

  case challenge
  when 1
    decoded_word = word
  when 2
    decoded_word = word.reverse
  when 3
    decoded_word = word.gsub(/[13406]/, '1' => 'i', '3' => 'e', '4' => 'a', '0' => 'o', '6' => 'u')
  when 4
    word_to_char = word.chars
    word_length = word.length
    a = word_to_char[word_length-3..word_length]
    b = word_to_char[0..word_length-4]
    z = a << b
    decoded_word = z.join
  when 5
    # binding.pry
    number_of_asterisks = word.count('*')
    vowels = 'aeiou'.chars

    posibilities = vowels.repeated_permutation(number_of_asterisks).to_a

    posibilities.each do |posibility|
      i = 0
      numbers = ("1".."#{number_of_asterisks}").to_a.map!{|x| x.to_i}.join
      word_with_numbers = word.chars.map! {|letter|  letter == "*" ? i = 1 + i : letter }.join
      decoded_word = word_with_numbers.tr("#{numbers}", "#{posibility.join}")
      response = interactor.call_to_the_url(url_to_send_answer, decoded_word)
      if response == "OK! - You have succesfully completed this challenge, please ask for another word to see the next challenge"
        break
      end
    end
  when 6
    # not working on server
  when 7
    alphabet = ('a'..'z').to_a
    decoded_word = word.gsub(/[#{alphabet}]/, '').gsub(/[13406]/, '1' => 'i', '3' => 'e', '4' => 'a', '0' => 'o', '6' => 'u').downcase
  when 8
    puts "YOU HAVE FINISHED!"
    break
  else
    puts "no challenge configured"
  end
  puts "word: #{word} => decoded word: #{decoded_word}"
  response = interactor.call_to_the_url(url_to_send_answer, decoded_word)
  puts "#{response}"
end












