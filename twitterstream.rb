require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'OSLJ9s4ep0223B0KH7lmIzGJ5'
  config.consumer_secret     = 'tTRjRD6JTVcnf2Hh0KVp344wI31KrWomPhVxh8EIQz6Mss2wAg'
  config.access_token        = '2982040868-T4G35Z7KkZP8RFfIAmNOZcM8t1kqk5AY6tHDWkO'
  config.access_token_secret = 'DawCand5hH4A9yFVbCbNAfiFEHMtmRL1t1g4QIJvg5LeT'
end

client.user do |object|
  case object
  when Twitter::Tweet
    p object.user.screen_name
    p object.text
  when Twitter::DirectMessage
    puts "It's a direct message!"
  when Twitter::Streaming::StallWarning
    warn "Falling behind!"
  end
end
