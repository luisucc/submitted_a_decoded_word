require 'net/http'

class InteractServer

  def talk_to_the_server(url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    res.body
  end

  # get a word to the server
  def get_word(word_url)
    talk_to_the_server(URI.parse(word_url))
  end

  # send a word to he server
  def send_word(answer_url, word)
    talk_to_the_server(URI.parse(answer_url+word))
  end




end

