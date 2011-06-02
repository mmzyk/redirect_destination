require 'sinatra'
require File.expand_path(File.join(File.dirname(__FILE__), 'redirect_follower.rb'))

get '/:name' do |url|
    if url == 'favicon.ico' 
      #do nothing - not sure why it is trying to grab the favicon
    else  
      url = 'http://' + url
      final_destination = RedirectFollower.new(url).resolve
    end
end  