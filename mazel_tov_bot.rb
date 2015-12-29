require 'rubygems'
require 'twitter'

class HTTP::URI                                                                                 
  def port                                                                                        
    443 if self.https?                                                                                                                                                                                  
  end                                                                                             
end

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "CONSUMER_KEY"
  config.consumer_secret     = "CONSUMER_SECRET"
  config.access_token        = "ACCESS_TOKEN"
  config.access_token_secret = "ACCESS_TOKEN_SECRET"
end

user = Twitter::REST::Client.new do |config|
  config.consumer_key        = "CONSUMER_KEY"
  config.consumer_secret     = "CONSUMER_SECRET"
  config.access_token        = "ACCESS_TOKEN"
  config.access_token_secret = "ACCESS_TOKEN_SECRET"
end

search_options = {
  result_type: "recent",
}

# client.search("mazel tov", search_options).take(3).each do |tweet|
#   puts "#{tweet.user.screen_name}: #{tweet.text}"
#  client.favorite(tweet)
#  client.update "@#{tweet.user.screen_name} Mazel Tov!"
# end


client.filter(track: "Mazel Tov") do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
  puts object.inspect
   user.favorite(object)
   user.update "@#{object.user.screen_name} Mazel Tov!"
end