require 'sinatra'
require 'erb'
require ::File.expand_path('../redirect_follower', __FILE__)

get '/' do
  erb :index
end

get '/:info' do
    url = params[:url]
     
    if not url.start_with? 'http://'
      url = 'http://' + url
    end   
     
    final_destination = RedirectFollower.new(url).resolve
end  

get '/:api' do
  "Api docs go here - how to use the service without accessing the main page"
  #Main page uses info for now
  
  #Potential endpoints:
  #destination endpoint - report back url destination
  #status code endpoint - reports back status code found
  #hops endpoint - how many redirects the url goes through
  #An everything endpoint - report back all of the above
end  