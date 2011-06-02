require 'sinatra'
require ::File.expand_path('../redirect_follower', __FILE__)

get '/:name' do |url|
    if url == 'favicon.ico' 
      #do nothing - not sure why it is trying to grab the favicon
    else  
      url = 'http://' + url
      final_destination = RedirectFollower.new(url).resolve
    end
end  