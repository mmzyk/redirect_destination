require 'sinatra'
require ::File.expand_path('../redirect_follower', __FILE__)

get '/' do
  "To check the final destination if a url redirects, go to this site /check and add the url as a parameter using the url identifier <br />
  It will look like this: www.thissite.com/check?url= url to check here. <br />
  The final destination after all redirects will be reported back, unless the operation reaches the redirect limit (5). <br /><br />
  For example, to check google.com, copy and past this in the address bar: http://warm-flower-161.heroku.com/google.com <br />
  Change google.com on the end of the url to check other urls. <br /><br />
  This is a work in progress and will break for many cases."
end

get '/:check' do
    url = params[:url]
     
    if not url.start_with? 'http://'
      url = 'http://' + url
    end   
     
    final_destination = RedirectFollower.new(url).resolve
end  
