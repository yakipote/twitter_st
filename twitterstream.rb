require 'twitter'
require 'net/http'
require 'uri'
require 'json'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'OSLJ9s4ep0223B0KH7lmIzGJ5'
  config.consumer_secret     = 'tTRjRD6JTVcnf2Hh0KVp344wI31KrWomPhVxh8EIQz6Mss2wAg'
  config.access_token        = '2982040868-T4G35Z7KkZP8RFfIAmNOZcM8t1kqk5AY6tHDWkO'
  config.access_token_secret = 'DawCand5hH4A9yFVbCbNAfiFEHMtmRL1t1g4QIJvg5LeT'
end

api_key = 'CA61BA3E57DE6FE4E20D693058C7FBE229A1A1BD'
url = 'http://ap.mextractr.net/ma9/emotion_analyzer?out=json&apikey='

client.user do |object|
  case object
  when Twitter::Tweet
    case object.user.screen_name
    when 'zafnen'
      p object.user.screen_name
      p object.text
      url_escape = URI.escape(url + api_key + '&text=' + object.text)
      uri = URI.parse(url_escape)
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
      p result
      p URI.unescape(result['analyzed_text'])
    end
  when Twitter::DirectMessage
    puts "It's a direct message!"
  when Twitter::Streaming::StallWarning
    warn "Falling behind!"
  end
end
