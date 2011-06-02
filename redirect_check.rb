require 'sinatra'
require ::File.expand_path('../redirect_follower', __FILE__)

get '/' do
  "To check the final destination if a url redirects, add it as a prameter onto the url for this site. <br />
  The final destination after all redirects will be reported back, unless the operation reaches the redirect limit (5). <br /><br />
  For example, to check google.com, copy and past this in the address bar: http://warm-flower-161.heroku.com/google.com <br />
  Change google.com on the end of the url to check other urls. <br /><br />
  This is a work in progress and will break for many cases."
end  

get '/:name' do |url|
    if url == 'favicon.ico' 
      #do nothing - not sure why it is trying to grab the favicon
    else  
      url = 'http://' + url
      final_destination = RedirectFollower.new(url).resolve
    end
end  