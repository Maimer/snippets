require 'sinatra'

# Create a SHA1 Hash

require 'digest/sha1'
Digest::SHA1.hexdigest 'foo'

# Be sure to set an environment variable containing your secret key.
# This will be used to encrypt the cookies that are sent to the client.
#
# $ export SECRET_TOKEN=super_secret_key_goes_here

use Rack::Session::Cookie, secret: ENV['SECRET_TOKEN']

get '/' do
  if session[:visit_count]
    session[:visit_count] += 1
    "You've visited this page #{session[:visit_count]} time(s)."
  else
    session[:visit_count] = 1
    "This is your first time here, welcome!"
  end
end
